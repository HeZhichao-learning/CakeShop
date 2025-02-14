package com.hezc.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;

public class C3p0Utils {
    private static DataSource ds;
    static {
        // 自动到classpath目录下面加载“c3p0-config.xml”配置文件
        ds = new ComboPooledDataSource();
    }
    public static DataSource getDataSource() {
        return ds;
    }

}
