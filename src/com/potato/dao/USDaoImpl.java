package com.potato.dao;

import com.potato.util.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author potato
 * @Description 关联id表接口实现类，操作数据库
 * @Date 2022-12-05 21:46
 */

public class USDaoImpl implements USDao {

    /**
     * 根据管理员id查询，得到一组id
     * @param uid 用户ID
     * @return 货物ID列表
     */
    @Override
    public List<Integer> findByUid1(int uid) {
        List<Integer> sids = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConn();
            String sql = "select id from goods_id where uid=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                sids.add(rs.getInt("id"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, ps, rs);
        }
        return sids;
    }

    /**
     * 根据管理员id查询，得到一组clientId
     * @param uid 用户ID
     * @return 客户ID列表
     */
    @Override
    public List<Integer> findByUid2(int uid) {
        List<Integer> sids = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConn();
            String sql = "select clientId from goods_id where uid=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                sids.add(rs.getInt("clientId"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, ps, rs);
        }
        return sids;
    }

    /**
     * 添加关联
     * @param uid 用户ID
     * @param goodsuid 货物ID
     * @return 是否成功
     */
    @Override
    public boolean updateUid(int uid, int goodsuid) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConn();
            String sql = "insert into goods_id(uid, id) values (?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, goodsuid);
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
     * 根据gooduid删除信息
     * @param gooduid 货物ID
     * @return 是否成功
     */
    @Override
    public boolean deleteId(int gooduid) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConn();
            String sql = "delete from goods_id where id=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, gooduid);
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
     * 根据clientId删除信息
     * @param clientId 客户ID
     * @return 是否成功
     */
    @Override
    public boolean deleteClientId(int clientId) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConn();
            String sql = "delete from goods_id where clientId=?";
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
}
