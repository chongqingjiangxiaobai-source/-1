package com.potato.dao;

import com.potato.util.DBUtils;
import com.potato.entity.User;

import java.sql.*;

/**
 * @Author potato
 * @Description 用户表接口实现类，操作数据库
 * @Date 2022-12-05 21:45
 */

public class UserDaoImpl implements UserDao {

    /**
     * 注册
     * @param u 用户对象
     * @return 是否成功
     */
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
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, ps, null);
        }
        return false;
    }

    /**
     * 登录
     * @param username 用户名
     * @param password 密码
     * @return 用户对象或null
     */
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
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, ps, rs);
        }
        return null;
    }

    /**
     * 根据用户名判断是否被注册
     * @param username 用户名
     * @return 用户对象或null
     */
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
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, ps, rs);
        }
        return null;
    }

    /**
     * 修改密码
     * @param username 用户名
     * @param password 新密码
     * @return 是否成功
     */
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
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, ps, null);
        }
        return false;
    }

    /**
     * 查询管理员信息
     * @param id 用户ID
     * @return 用户对象或null
     */
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
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, ps, rs);
        }
        return null;
    }

    /**
     * 根据用户名查询管理员信息
     * @param name 用户名
     * @return 用户对象或null
     */
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
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, ps, rs);
        }
        return null;
    }

    /**
     * 封装结果集 -> 解析为具体的Java对象
     * @param rs 结果集
     * @return 用户对象
     */
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
