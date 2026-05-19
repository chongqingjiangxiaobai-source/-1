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
<body class="content-body">

<div class="page-header-bar">
  <div class="breadcrumb-bar">
    <a href="home_page.jsp">首页</a> <span>›</span> 仓库列表
  </div>
  <a href="add_goods.jsp" class="btn-primary" style="display:inline-flex;align-items:center;gap:6px;text-decoration:none;">
    ➕ 添加入库
  </a>
</div>

<div class="dash-card" style="padding:0;overflow:hidden;">
  <div class="card-title" style="padding:16px 20px;margin:0;border-radius:14px 14px 0 0;background:linear-gradient(135deg,#1B2A3B,#243447);">
    📋 仓库列表
  </div>
  <div style="overflow-x:auto;">
    <table class="data-table">
      <thead>
        <tr>
          <th class="cell-check"><input type="checkbox" /></th>
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
          <tr><td colspan="8" style="color:#bbb;font-size:13px;padding:30px;">暂无数据</td></tr>
        </c:if>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
