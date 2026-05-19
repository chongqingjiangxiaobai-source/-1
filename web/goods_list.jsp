<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>仓库列表</title>
  <link rel="stylesheet" href="css/global.css" />
  <link rel="stylesheet" href="css/page.css" />
  <script src="js/jquery-3.2.1.js"></script>
  <script src="./js/xhr.js"></script>
  <script src="./js/list.js"></script>
</head>
<body class="glass-body">

<div class="main-content">
  <div class="page-header-bar">
    <div class="breadcrumb-bar">
      <a href="home_page.jsp">首页</a> <span>›</span> 仓库列表
    </div>
    <a href="add_goods.jsp" class="btn-glass">➕ 添加入库</a>
  </div>

  <div class="glass-card" style="padding:0;overflow:hidden;">
    <div class="card-title" style="padding:18px 24px;margin:0;background:rgba(12,224,147,0.05);border-radius:20px 20px 0 0;">
      📋 仓库列表
    </div>
    <div style="overflow-x:auto;padding:4px;">
      <table class="data-table">
        <thead>
          <tr>
            <th style="width:36px;"><input type="checkbox" /></th>
            <th>序号</th>
            <th>货物ID</th>
            <th>货物名称</th>
            <th>数量</th>
            <th>生产地址</th>
            <th>入库时间</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${goods}" var="goodss" varStatus="v">
            <tr>
              <td><input type="checkbox" /></td>
              <td>${v.index+1}</td>
              <td>${goodss.id}</td>
              <td>${goodss.name}</td>
              <td>${goodss.num}</td>
              <td>${goodss.site}</td>
              <td>${goodss.time}</td>
              <td>
                <button class="btn-tbl-edit" onclick="mydetails(${goodss.id})">✏️ 修改</button>
                <button class="btn-tbl-del" onclick="myDelete(${goodss.id},${sessionScope.u.id})">🗑️ 删除</button>
              </td>
            </tr>
          </c:forEach>
          <c:if test="${empty goods}">
            <tr><td colspan="8" style="color:#aaa;padding:40px;">暂无数据</td></tr>
          </c:if>
        </tbody>
      </table>
    </div>
  </div>

  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>
</body>
</html>