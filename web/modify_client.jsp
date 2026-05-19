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
<body class="content-body">

<div class="page-header-bar">
  <div class="breadcrumb-bar">
    <a href="home_page.jsp">首页</a> <span>›</span>
    <a href="client.jsp">客户信息</a> <span>›</span> 修改
  </div>
</div>

<div class="form-panel" style="max-width:560px;">
  <div class="form-title">✏️ 客户信息修改</div>
  <form action="updateClientServlet" target="_parent">
    <input value="${sessionScope.u.id}" name="uid" type="hidden">

    <div class="form-row">
      <label>客户编号</label>
      <input type="text" class="input-field" name="clientId" value="${c.clientId}" readonly style="background:#f5f5f5;color:#888;" />
    </div>
    <div class="form-row">
      <label>客户姓名</label>
      <input type="text" class="input-field" name="name" value="${c.name}" readonly style="background:#f5f5f5;color:#888;" />
    </div>
    <div class="form-row">
      <label>性别</label>
      <input type="text" class="input-field" name="gender" value="${c.gender}" readonly style="background:#f5f5f5;color:#888;" />
    </div>
    <div class="form-row">
      <label>货物 ID</label>
      <input type="text" class="input-field" name="goodsId" value="${c.goodsId}" />
    </div>
    <div class="form-row">
      <label>需求数量</label>
      <input type="text" class="input-field" name="goodsNum" value="${c.goodsNum}" />
    </div>

    <div style="display:flex;gap:12px;margin-top:24px;">
      <button type="submit" class="btn-primary" style="height:40px;padding:0 28px;display:inline-flex;align-items:center;gap:6px;">
        ✅ 确认修改
      </button>
      <a href="client.jsp" class="btn-default" style="height:40px;padding:0 20px;display:inline-flex;align-items:center;text-decoration:none;">
        ← 返回
      </a>
    </div>
  </form>
</div>
</body>
</html>
