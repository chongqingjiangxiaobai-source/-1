<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>客户信息</title>
  <link rel="stylesheet" href="css/global.css" />
  <script src="js/jquery-3.2.1.js"></script>
  <script src="./js/xhr.js"></script>
  <script src="./js/client.js"></script>
</head>
<body class="glass-body">
<div class="main-content">
  <div class="page-header-bar">
    <div class="breadcrumb-bar">
      <a href="home_page.jsp">首页</a> <span>›</span> 客户信息
    </div>
  </div>
  <div class="glass-card" style="padding:0;overflow:hidden;">
    <div class="panel-header">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
      客户信息
    </div>
    <div class="table-wrap">
      <table class="data-table">
        <thead>
          <tr>
            <th>客户编号</th><th>姓名</th><th>性别</th><th>年龄</th>
            <th>货物ID</th><th>货物数量</th><th>操作</th>
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
                <button class="btn-tbl-edit" onclick="clientDetails(${clients.clientId})">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
                  修改
                </button>
                <button class="btn-tbl-del" onclick="clientDelete(${clients.clientId},${sessionScope.u.id})">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg>
                  删除
                </button>
              </td>
            </tr>
          </c:forEach>
          <c:if test="${empty client}">
            <tr><td colspan="7" style="color:var(--color-text-3);padding:48px;">暂无客户数据</td></tr>
          </c:if>
        </tbody>
      </table>
    </div>
  </div>
  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>
</body>
</html>
