package com.hezc.dao;

import com.hezc.bean.Type;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class TypeDao {
    QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
public List<Type>  getAllType(){
    String sql="select * from type";
    List<Type> list=null;
    try {
        list=runner.query(sql,new BeanListHandler<>(Type.class));
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    return list;

}
public Type getByid(int id){
    Type type=null;
    String sql="select * from type where id=?";
    try {
        type=runner.query(sql,new BeanHandler<>(Type.class),id);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }return type;
}

public int insert(Type type){
    int r;
    String sql="insert into type(name) values(?)";
    try {
        r=runner.update(sql,type.getName());
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    return r;
}

public int delete(int id){
    int r=0;
    String sql="delete from type where id=?";
    try {
        r=runner.update(sql,id);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    return r;

}

public  int update(Type type){
    int r=0;
    String sql="update type set name=? where id=?";

    try {
        r=runner.update(sql,type.getName(),type.getId());
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }return r;
}

}
