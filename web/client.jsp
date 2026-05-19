<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>客户信息</title>
  <link rel="stylesheet" href="css/global.css" />
  <link rel="stylesheet" href="css/page.css" />
  <script src="js/jquery-3.2.1.js"></script>
  <script src="./js/xhr.js"></script>
  <script src="./js/client.js"></script>
</head>
<body class="content-body">

<div class="page-header-bar">
  <div class="breadcrumb-bar">
    <a href="home_page.jsp">首页</a> <span>›</span> 客户信息
  </div>
</div>

<div class="dash-card" style="padding:0;overflow:hidden;">
  <div class="card-title" style="padding:16px 20px;margin:0;border-radius:14px 14px 0 0;background:linear-gradient(135deg,#1B2A3B,#243447);">
    👥 客户信息
  </div>
  <div style="overflow-x:auto;">
    <table class="data-table">
      <thead>
        <tr>
          <th>客户编号</th>
          <th>姓名</th>
          <th>性别</th>
          <th>年龄</th>
          <th>货物ID</th>
          <th>货物数量</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${client}" var="clients" varStatus="v">
          <tr>
            <td>${clients.clientId}</td>
            <td>${clients.name}</td>
            <td>${clients.gender}</td>
            <td>${clients.age}</td>
            <td>${clients.goodsId}</td>
            <td>${clients.goodsNum}</td>
            <td>
              <button class="btn-tbl-edit" onclick="clientDetails(${clients.clientId})">✏️ 修改</button>
              <button class="btn-tbl-del" onclick="clientDelete(${clients.clientId},${sessionScope.u.id})">🗑️ 删除</button>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty client}">
          <tr><td colspan="7" style="color:#bbb;font-size:13px;padding:30px;">暂无客户数据</td></tr>
        </c:if>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
