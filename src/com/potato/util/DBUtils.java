package com.potato.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

/**
 * @Author potato
 * @Description JDBC连接数据库工具类
 * @Date 2022-12-04 11:52
 */

public class DBUtils {
    // 用户名
    static String username = null;
    // 密码
    static String pwd = null;
    // 驱动地址
    static String driverName = null;
    // url地址
    static String url = null;

    // 使用静态代码块赋值，通过类加载器读取classpath下的配置文件
    static {
        try {
            // 使用类加载器读取classpath下的资源
            InputStream in = DBUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            if (in == null) {
                // 尝试直接加载（兼容旧路径）
                in = DBUtils.class.getClassLoader().getResourceAsStream("com/potato/util/jdbc.properties");
            }
            Properties p = new Properties();
            p.load(in);
            username = p.getProperty("username");
            pwd = p.getProperty("pwd");
            url = p.getProperty("url");
            driverName = p.getProperty("driverName");
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 获得链接
    public static Connection getConn() throws ClassNotFoundException, SQLException {
        if (url == null) {
            throw new SQLException("Database URL is not configured. Check jdbc.properties.");
        }
        Class.forName(driverName);
        return DriverManager.getConnection(url, username, pwd);
    }

    // 关闭连接
    public static void close(Connection conn, Statement ps, ResultSet rs) {
        try {
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (ps != null) ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
