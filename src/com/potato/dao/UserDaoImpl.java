package com.potato.dao;

import com.potato.util.DBUtils;
import com.potato.entity.User;

import java.sql.*;

/**
 * 用户表接口实现类，操作数据库
 */
public class UserDaoImpl implements UserDao {

    /** 注册 */
    @Override
    public boolean save(User u) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConn();
            String sql = "insert into user(username, password) values (?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Database error during save: " + e.getMessage(), e);
        } finally {
            DBUtils.close(conn, ps, null);
        }
    }

    /** 登录：PreparedStatement 防注入，明文比对密码（生产环境应改为加盐哈希） */
    @Override
    public User login(String username, String password) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConn();
            String sql = "select * from user where username=? and password=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("id"), username, password);
                u.setAge(rs.getInt("age"));
                u.setGender(rs.getString("gender"));
                return u;
            }
            return null; // 用户名或密码错误
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Database error during login: " + e.getMessage(), e);
        } finally {
            DBUtils.close(conn, ps, rs);
        }
    }

    /** 根据用户名判断是否被注册 */
    @Override
    public User findByUsername(String username) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConn();
            String sql = "select * from user where username=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("id"), username, rs.getString("password"));
                u.setAge(rs.getInt("age"));
                u.setGender(rs.getString("gender"));
                return u;
            }
            return null;
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Database error during findByUsername: " + e.getMessage(), e);
        } finally {
            DBUtils.close(conn, ps, rs);
        }
    }

    /** 修改密码 */
    @Override
    public boolean rePwd(String username, String password) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConn();
            String sql = "update user set password=? where username=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Database error during rePwd: " + e.getMessage(), e);
        } finally {
            DBUtils.close(conn, ps, null);
        }
    }

    /** 查询管理员信息 */
    @Override
    public User select1(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConn();
            String sql = "select * from user where id=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rsToUser(rs);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Database error during select1: " + e.getMessage(), e);
        } finally {
            DBUtils.close(conn, ps, rs);
        }
        return null;
    }

    /** 根据用户名查询管理员信息 */
    @Override
    public User select2(String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConn();
            String sql = "select * from user where username=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rsToUser(rs);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Database error during select2: " + e.getMessage(), e);
        } finally {
            DBUtils.close(conn, ps, rs);
        }
        return null;
    }

    private User rsToUser(ResultSet rs) throws SQLException {
        User s = new User();
        s.setId(rs.getInt("id"));
        s.setUsername(rs.getString("username"));
        s.setPassword(rs.getString("password"));
        s.setAge(rs.getInt("age"));
        s.setGender(rs.getString("gender"));
        return s;
    }
}