package com.potato.dao;

import com.potato.entity.Client;
import com.potato.util.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author potato
 * @Description 客户实现接口，操作数据库
 * @Date 2022-12-10 21:56
 */

public class ClientDaoImpl implements ClientDao {

    /**
     * 根据客户id查询客户信息
     * @param cli 客户ID
     * @return 客户对象或null
     */
    @Override
    public Client selectClient(int cli) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConn();
            String sql = "select * from client where clientId=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cli);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rsToSong(rs);
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
     * 将查询到的信息封装到list列表中
     * @param clis 客户ID列表
     * @return 客户列表
     */
    @Override
    public List<Client> findBySidList2(List<Integer> clis) {
        List<Client> client = new ArrayList<>();
        for (int i = 0; i < clis.size(); i++) {
            Client s = selectClient(clis.get(i));
            if (s != null) {
                client.add(s);
            }
        }
        return client;
    }

    /**
     * 更新客户信息
     * @param goodsId 货物ID
     * @param goodsNum 货物数量
     * @param clientId 客户ID
     * @return 是否成功
     */
    public boolean update(int goodsId, int goodsNum, int clientId) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConn();
            String sql = "update client set goodsId=?, goodsNum=? where clientId=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, goodsId);
            ps.setInt(2, goodsNum);
            ps.setInt(3, clientId);
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
     * 根据客户编号删除客户
     * @param clientId 客户ID
     * @return 是否成功
     */
    public boolean deleteClientById(int clientId) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConn();
            String sql = "delete from client where clientId=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, clientId);
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
     * 封装结果集 -> 解析为具体的Java对象
     * @param rs 结果集
     * @return 客户对象
     */
    private Client rsToSong(ResultSet rs) throws SQLException {
        Client c = new Client();
        c.setClientId(rs.getInt("clientId"));
        c.setName(rs.getString("name"));
        c.setGender(rs.getString("gender"));
        c.setAge(rs.getInt("age"));
        c.setGoodsId(rs.getInt("goodsId"));
        c.setGoodsNum(rs.getInt("goodsNum"));
        return c;
    }
}
