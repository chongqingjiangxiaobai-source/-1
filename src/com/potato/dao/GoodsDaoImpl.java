package com.potato.dao;

import com.potato.entity.Goods;
import com.potato.entity.PageInfo;
import com.potato.util.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author potato
 * @Description 货物接口实现类，操作数据库
 * @Date 2022-12-05 21:56
 */

public class GoodsDaoImpl implements GoodsDao {

    /**
     * 添加货物信息
     * @param g 货物对象
     * @return 是否成功
     */
    @Override
    public boolean save(Goods g) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConn();
            String sql = "insert into goods(id, name, num, site, time) values (?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, g.getId());
            ps.setString(2, g.getName());
            ps.setInt(3, g.getNum());
            ps.setString(4, g.getSite());
            ps.setTimestamp(5, g.getTime());
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
     * 根据id查询货物信息
     * @param id 货物ID
     * @return 货物对象或null
     */
    public Goods findGoodsById(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConn();
            String sql = "select * from goods where id=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
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
     * 将查询到的信息放入list列表中
     * @param sids 货物ID列表
     * @return 货物列表
     */
    @Override
    public List<Goods> findBySidList(List<Integer> sids) {
        List<Goods> goods = new ArrayList<>();
        for (int i = 0; i < sids.size(); i++) {
            Goods s = findGoodsById(sids.get(i));
            if (s != null) {
                goods.add(s);
            }
        }
        return goods;
    }

    /**
     * 根据货物id删除货物
     * @param id 货物ID
     * @return 是否成功
     */
    public boolean deleteGoodsById(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConn();
            String sql = "delete from goods where id=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
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
     * @return 货物对象
     */
    private Goods rsToSong(ResultSet rs) throws SQLException {
        Goods s = new Goods();
        s.setId(rs.getInt("id"));
        s.setName(rs.getString("name"));
        s.setNum(rs.getInt("num"));
        s.setSite(rs.getString("site")); // Fixed: was "Site" (capital S)
        s.setTime(rs.getTimestamp("time"));
        return s;
    }

    /**
     * 更新货物信息
     * @param name 货物名称
     * @param num 货物数量
     * @param id 货物ID
     * @return 是否成功
     */
    public boolean update(String name, int num, int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConn();
            String sql = "update goods set name=?, num=? where id=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, num);
            ps.setInt(3, id);
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
     * 查询全部数据 - 分页操作
     * @param uid 用户ID
     * @param pageInfo 分页信息
     */
    @Override
    public void selectPage(int uid, PageInfo pageInfo) {
        List list = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConn();
            String sql = "select * from goods where id=? limit ?,?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, (pageInfo.getCurrentPage() - 1) * pageInfo.getRecordSize());
            ps.setInt(3, pageInfo.getRecordSize());
            rs = ps.executeQuery();
            while (rs.next()) {
                Goods g = rsToSong(rs);
                list.add(g);
            }
            pageInfo.setList(list);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, ps, rs);
        }
    }
}
