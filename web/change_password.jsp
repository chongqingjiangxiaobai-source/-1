<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>修改密码</title>
  <link rel="stylesheet" href="css/global.css" />
  <link rel="stylesheet" href="css/page.css" />
  <script src="js/jquery-3.2.1.js"></script>
  <script src="layer/layer.js"></script>
</head>
<body class="content-body">

<div class="page-header-bar">
  <div class="breadcrumb-bar">
    <a href="home_page.jsp">首页</a> <span>›</span> 修改密码
  </div>
</div>

<div class="form-panel" style="max-width:520px;">
  <div class="form-title">🔑 修改密码</div>
  <form action="changePasswordServlet" target="_parent">
    <input value="${sessionScope.u.id}" name="id" type="hidden">

    <div class="form-row">
      <label>用户名</label>
      <input type="text" class="input-field" name="username" readonly value="${sessionScope.u.username}" />
    </div>
    <div class="form-row">
      <label>原密码</label>
      <input type="text" class="input-field" name="oldpwd" readonly value="${sessionScope.u.password}" style="background:#f5f5f5;color:#888;" />
    </div>
    <div class="form-row">
      <label>新密码</label>
      <input type="text" class="input-field" name="newpwd" placeholder="请输入新密码" required />
    </div>

    <div style="display:flex;gap:12px;margin-top:24px;">
      <button type="submit" class="btn-primary" style="height:40px;padding:0 28px;display:inline-flex;align-items:center;gap:6px;">
        ✅ 确认修改
      </button>
      <a href="home_page.jsp" class="btn-default" style="height:40px;padding:0 20px;display:inline-flex;align-items:center;text-decoration:none;">
        ← 返回
      </a>
    </div>
  </form>
</div>

</body>
</html>
