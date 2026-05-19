<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>客户信息修改</title>
  <link rel="stylesheet" href="css/global.css" />
  <link rel="stylesheet" href="css/page.css" />
  <script src="js/jquery-3.2.1.js"></script>
  <script src="layer/layer.js"></script>
  <script src="./js/xhr.js"></script>
  <script src="./js/list.js"></script>
</head>
<body class="glass-body">

<div class="main-content">
  <div class="page-header-bar">
    <div class="breadcrumb-bar">
      <a href="home_page.jsp">首页</a> <span>›</span>
      <a href="client.jsp">客户信息</a> <span>›</span> 修改
    </div>
  </div>

  <div class="glass-card glass-form" style="padding:32px;">
    <div class="card-title">✏️ 客户信息修改</div>
    <form action="updateClientServlet" target="_parent">
      <input value="${sessionScope.u.id}" name="uid" type="hidden">
      <div class="form-row">
        <label>客户编号</label>
        <input type="text" class="glass-input" name="clientId" value="${c.clientId}" readonly />
      </div>
      <div class="form-row">
        <label>客户姓名</label>
        <input type="text" class="glass-input" name="name" value="${c.name}" readonly />
      </div>
      <div class="form-row">
        <label>性别</label>
        <input type="text" class="glass-input" name="gender" value="${c.gender}" readonly />
      </div>
      <div class="form-row">
        <label>货物 ID</label>
        <input type="text" class="glass-input" name="goodsId" value="${c.goodsId}" />
      </div>
      <div class="form-row">
        <label>需求数量</label>
        <input type="text" class="glass-input" name="goodsNum" value="${c.goodsNum}" />
      </div>
      <div style="display:flex;gap:12px;margin-top:26px;">
        <button type="submit" class="btn-glass" style="height:44px;padding:0 28px;">✅ 确认修改</button>
        <a href="client.jsp" class="btn-subtle" style="height:44px;display:inline-flex;align-items:center;">← 返回</a>
      </div>
    </form>
  </div>

  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>
</body>
</html>