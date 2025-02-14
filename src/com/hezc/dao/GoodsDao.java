package com.hezc.dao;

import com.hezc.bean.Goods;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class GoodsDao {
    QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
    public List<Goods> getGoosList(int type){
        String sql="select g.*,t.name typename from recommend r,goods g,type t where r.type=? and r.goods_id=g.id and g.type_id=t.id limit 0,9";
        try {
            return runner.query(sql,new BeanListHandler<>(Goods.class),type);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

        public Goods getById(int id){
            String sql="select g.*,t.name typename from goods g,type t where g.type_id=t.id and g.id=?";
            try {
                 return runner.query(sql,new BeanHandler<>(Goods.class),id);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        public List<Goods> getAllGoods(int typeid,int start,int psize){

        if(typeid==0) {
            String sql = "select * from goods limit ?,?";
            try {
                return runner.query(sql,new BeanListHandler<>(Goods.class),start,psize);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            String sql1 = "select * from goods where type_id=? limit ?,?";
            try {
                return runner.query(sql1,new BeanListHandler<>(Goods.class),typeid,start,psize);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        }
        public int count (Integer typeid){

        Long r=0l;

        if(typeid==0){
            String sql="select count(*) from goods";
            try {
                r=runner.query(sql,new ScalarHandler<>());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        else {
            String sql="select count(*) from goods where type_id=?";
            try {
                r=runner.query(sql,new ScalarHandler<>(),typeid);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }return r.intValue();
        }


        public  List<Goods> searchGoods(String key,int start,int psize){

        String sql="select * from goods where name like ? limit ?,?";
        String key1="%"+key+"%";
            try {
              return   runner.query(sql,new BeanListHandler<>(Goods.class),key1,start,psize);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }


        public int countSearch(String key){

        String sql="select count(*) from goods where name like ?";
        String key1="%"+key+"%";

        Long a=0l;

            try {
                a=runner.query(sql,new ScalarHandler<>(),key1);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return a.intValue();
        }

    public List<Goods> getGoosList2(int type){
        String sql="select g.*,t.name typename from recommend r,goods g,type t where r.type=? and r.goods_id=g.id and g.type_id=t.id";
        try {
            return runner.query(sql,new BeanListHandler<>(Goods.class),type);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    //后台管理========================================================

    public List<Goods> getGooList2(int type){
        String sql="select g.*,t.name typename from recommend r,goods g,type t where r.type=? and r.goods_id=g.id and g.type_id=t.id";
        try {
            return runner.query(sql,new BeanListHandler<>(Goods.class),type);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Goods> getGoodsList2(Integer type,int start,int psize){
        List<Goods> goodsList=null;
        if(type==0){
            String sql="select g.*,t.name typename,r.type tuijian from goods g left join type t on g.type_id=t.id left join recommend r on g.id=r.goods_id limit ?,?";
            try {
                goodsList=runner.query(sql,new BeanListHandler<>(Goods.class),start,psize);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            String sql="select g.*,t.name typename,r.type tuijian from goods g left join type t on g.type_id=t.id left join recommend r on g.id=r.goods_id where r.type=? limit ?,?";
            try {
                goodsList=runner.query(sql,new BeanListHandler<>(Goods.class),type,start,psize);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }return goodsList;
    }


    public  int count2(int tid){
        String sql="select count(*) from goods left join type on goods.type_id=type.id left join recommend r on r.goods_id=goods.id";
        String sql2="select count(*) from goods left join type on goods.type_id=type.id left join recommend r on r.goods_id=goods.id where r.type=?";
        Long a=0L;
        if (tid==0){
            try {
                a=runner.query(sql,new ScalarHandler<>());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            try {
                a=runner.query(sql2,new ScalarHandler<>(),tid);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }return a.intValue();
    }
    public  void insertRecommend(int type, int goods_id){
        String sql="insert into recommend(type,goods_id) values(?,?)";
        try {
            runner.update(sql,type,goods_id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public  void deleteRecommend(int type, int goods_id){
        String sql="delete from recommend where type=? and goods_id=?";
        try {
            runner.update(sql,type,goods_id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    public void addGoods(Goods goods){
        if(goods==null){
            try {
                throw new IllegalAccessException("Invalid goods object");
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        }
        String sql="insert into goods(name,cover,image1,image2,price,intro,stock,type_id) values (?,?,?,?,?,?,?,?)";
            try {
                runner.update(sql,goods.getName(),goods.getCover(),goods.getImage1(),goods.getImage2(),goods.getPrice(),goods.getIntro(),goods.getStock(),goods.getType_id());
            } catch (SQLException e) {
               e.printStackTrace();
            }

    }
    public void delete(int id){
        String sql="delete from goods where id=?";
        try {
            runner.update(sql,id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateGoods(Goods goods){

       if(goods==null){
           throw new IllegalArgumentException("Invalid goods");

       }
       String sql="update goods set name=?,cover=?,image1=?,image2=?,price=?,intro=?,stock=?,type_id=? where id=?";
        try {
            runner.update(sql,goods.getName(),goods.getCover(),goods.getImage1(),goods.getImage2(),goods.getPrice(),goods.getIntro(),goods.getStock(),goods.getType_id(),goods.getId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }








}
