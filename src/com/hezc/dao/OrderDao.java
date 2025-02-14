package com.hezc.dao;

import com.hezc.bean.Goods;
import com.hezc.bean.Order;
import com.hezc.bean.OrderItem;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;

public class OrderDao {
    QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
    public  int addOrderItem(OrderItem item){
        String sql="insert into orderitem(price,amount,order_id,goods_id) value(?,?,?,?)";
        int r= 0;
        try {
            r=runner.update(sql,item.getPrice(),item.getAmount(),item.getOrder_id(),item.getGoods_id());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return r;
    }
    public void addOrder(Order order){
        String sql="insert into `order`(total,amount,status,paytype,name,phone,address,user_id) value(?,?,?,?,?,?,?,?)";
        String sql2="select @@identity";
        BigInteger num=null;
        try {

            num=runner.insert(sql,new ScalarHandler<BigInteger>(),order.getTotal(),order.getAmount(),order.getStatus(),order.getPaytype(),order.getName(),order.getPhone(),order.getAddress(),order.getUser_id());
//            num=(BigInteger) runner.query(sql2,new ScalarHandler<>(1));
            for(OrderItem oi :order.getItemMap().values()){
                oi.setOrder_id(num.intValue());
                addOrderItem(oi);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public List<OrderItem> selectItem(int order_id){
        List<OrderItem> itemList = null;
        String sql = "select * from orderitem where order_id = ?";
        GoodsDao goodsDao = new GoodsDao();
        try {
            itemList = runner.query(sql,new BeanListHandler<>(OrderItem.class),order_id);
            for(OrderItem item:itemList){
                Goods g = goodsDao.getById(item.getGoods_id());
                item.setGoods(g);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return itemList;
    }

    public List<Order> selectAll(int user_id){
        List<Order> orderList = null;
        String sql = "select * from `order` where user_id = ? order by datetime desc";
        try {
            orderList = runner.query(sql,new BeanListHandler<>(Order.class),user_id);
            for(Order o: orderList){
                List<OrderItem> itemList = selectItem(o.getId());
                o.setItemList(itemList);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  orderList;
    }

    public  List<OrderItem> selectItems(Integer order_id){
        String sql="select * from orderitem where order_id=?";
        Goods g=null;
        List<OrderItem> itemList=null;
        GoodsDao Gdao=new GoodsDao();
        try {
            itemList= runner.query(sql,new BeanListHandler<>(OrderItem.class),order_id);
            for(OrderItem item:itemList){
                g=Gdao.getById(item.getGoods_id());
                item.setGoods(g);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return itemList;
    }
//查询用户订单
    public  List<Order> selectOrders(Integer user_id){
        String sql="select * from `order` where user_id=? order by datetime desc";
        List<Order> orderList=null;
        List<OrderItem> itemList=null;

        try {

            orderList=runner.query(sql,new BeanListHandler<>(Order.class),user_id);
            for (Order o: orderList){
                itemList=selectItems(o.getId());
                o.setItemList(itemList);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }return orderList;

    }

    public void orderdelete(int id){

        int r=0;
        String sql="delete from `order` where id=?";
        String sql2="delete from orderitem where order_id=?";

        try {
            runner.update(sql,id);

            runner.update(sql2,id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
//houtaiguanli===================================
    /**
     * 查询所有订单  1-未付款 2-已付款 3-配送中 4-已完成
     */
    public List<Order> selectAllOrders(int status,int start,int psize){
        String sql="select o.*,u.name as username from `order` o,user u where o.user_id=u.id order by datetime desc limit ?,?";
        String sql2="select o.*,u.name as username from `order` o,user u where o.user_id=u.id and status=? order by datetime desc limit ?,?";

        List<Order> orderList=null;

            try {
                if(status==0) {
                    orderList = runner.query(sql, new BeanListHandler<>(Order.class), start, psize);
                }else {
                    orderList=runner.query(sql2,new BeanListHandler<>(Order.class),status,start,psize);
                }
                } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            //利用每一个order订单的id查询订单详情，并设置
        for(Order order:orderList){
            order.setItemList(selectItem(order.getId()));
        }return orderList;
    }
    public  int countOrder(int status){
        String sql="select count(*) from `order`";
        String sql2="select count(*) from `order` where status=?";
        Long a=0l;
        try {
            if(status==0)
            a=runner.query(sql,new ScalarHandler<>());
            else
                a=runner.query(sql2,new ScalarHandler<>(),status);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }return a.intValue();
    }
    public void operate(int id,int status){
        String sql="update `order` set status=? where id=?";
        try {
            runner.update(sql,status,id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public  void delete (int id){
        String sql="delete from `order` where id=?";
        try {
            runner.update(sql,id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }





}











