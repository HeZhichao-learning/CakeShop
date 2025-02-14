package com.hezc.dao;

import com.hezc.bean.user;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class userdao {
    QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
    public int insert(user user){
        int r=0;
        String sql="insert into user(username,email,password,name,phone,address,isadmin,isvalidate) values(?,?,?,?,?,?,?,?)";
        try {
            r=runner.update(sql,user.getUsername(),user.getEmail(),user.getPassword(),user.getName(),user.getPhone(),user.getAddress(),user.getIsadmin(),user.getIsvalidate());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }return r;
    }
    public user checkname(String name){
         String sql="select * from user where username=?";
        try {
             return  runner.query(sql,new BeanHandler<>(user.class),name);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public user checkemail(String email){
        String sql="select * from user where email=?";
        try {
            return  runner.query(sql,new BeanHandler<>(user.class),email);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public user login(String name, String password){
        String sql="select * from user where username=? and password=?";
        try {
           return runner.query(sql,new BeanHandler<>(user.class),name,password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int updateuser(user user){
        String sql="update user set username=?,email=?,password=?,name=?,phone=?,address=?,isadmin=?,isvalidate=? where id=?";
        try {
          return runner.update(sql,user.getUsername(),user.getEmail(),user.getPassword(),user.getName(),user.getPhone(),user.getAddress(),user.getIsadmin(),user.getIsvalidate(),user.getId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<user> getAlluser(int start,int psize){

        String sql="select * from user limit ?,?";
        try {
            return runner.query(sql,new BeanListHandler<>(user.class),start,psize);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public  int countUser(){
        Long r=0l;
        String sql="select count(*) from user";
        try {
            r=runner.query(sql,new ScalarHandler<>());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return r.intValue();
    }
    public user getbyid(int id){
        String sql="select * from user where id=?";

        try {
          return runner.query(sql,new BeanHandler<>(user.class),id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public int delete(int id){
        int r=0;
        String sql="delete from user where id=?";
        try {
            r=runner.update(sql,id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }return r;
    }

    public List<user> searchUser(String name,String username,String phone,int start,int psize){
        String sql="select * from user where name like ? and username like ? and phone like ? limit ?,?";
        String name1="%"+name+"%";
        String username1="%"+username+"%";
        String phone1="%"+phone+"%";


        try {
            return runner.query(sql,new BeanListHandler<>(user.class),name1,username1,phone1,start,psize);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int countUser2(String name,String username,String phone){
        Long l=0l;
        String sql="select count(*) from user where name like ? and username like ? and phone like ?";
        String name1="%"+name+"%";
        String username1="%"+username+"%";
        String phone1="%"+phone+"%";


        try {
            l= runner.query(sql,new ScalarHandler<>(),name1,username1,phone1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }return l.intValue();
    }






    
}
