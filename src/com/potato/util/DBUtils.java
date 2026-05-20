package com.potato.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

/**
 * @Author potato
 * @Description JDBC连接数据库工具类
 */
public class DBUtils {
    static String username = null;
    static String pwd = null;
    static String driverName = null;
    static String url = null;

    static {
        // try-with-resources 保证 InputStream 无论是否异常都能正确关闭
        try (InputStream in = DBUtils.class.getClassLoader().getResourceAsStream("jdbc.properties")) {
            if (in == null) {
                // 尝试直接加载（兼容旧路径）
                try (InputStream in2 = DBUtils.class.getClassLoader().getResourceAsStream("com/potato/util/jdbc.properties")) {
                    if (in2 == null) {
                        throw new IOException("jdbc.properties not found in classpath");
                    }
                    Properties p = new Properties();
                    p.load(in2);
                    loadProperties(p);
                }
            } else {
                Properties p = new Properties();
                p.load(in);
                loadProperties(p);
            }
        } catch (IOException e) {
            throw new ExceptionInInitializerError("Failed to load jdbc.properties: " + e.getMessage());
        }
    }

    private static void loadProperties(Properties p) {
        username     = p.getProperty("username");
        pwd          = p.getProperty("pwd");
        url          = p.getProperty("url");
        driverName   = p.getProperty("driverName");
        if (username == null || pwd == null || url == null || driverName == null) {
            throw new ExceptionInInitializerError("jdbc.properties missing required fields");
        }
    }

    public static Connection getConn() throws ClassNotFoundException, SQLException {
        if (url == null) {
            throw new SQLException("Database URL is not configured. Check jdbc.properties.");
        }
        Class.forName(driverName);
        return DriverManager.getConnection(url, username, pwd);
    }

    public static void close(Connection conn, Statement ps, ResultSet rs) {
        try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
        try { if (ps != null) ps.close(); } catch (SQLException e) { /* ignored */ }
        try { if (conn != null) conn.close(); } catch (SQLException e) { /* ignored */ }
    }
}