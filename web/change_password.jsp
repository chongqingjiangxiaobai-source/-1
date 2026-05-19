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
<body class="glass-body">

<div class="main-content">
  <div class="page-header-bar">
    <div class="breadcrumb-bar">
      <a href="home_page.jsp">首页</a> <span>›</span> 修改密码
    </div>
  </div>

  <div class="glass-card glass-form" style="padding:32px;">
    <div class="card-title">🔑 修改密码</div>
    <form action="changePasswordServlet" target="_parent">
      <input value="${sessionScope.u.id}" name="id" type="hidden">
      <div class="form-row">
        <label>用户名</label>
        <input type="text" class="glass-input" name="username" readonly value="${sessionScope.u.username}" />
      </div>
      <div class="form-row">
        <label>原密码</label>
        <input type="text" class="glass-input" name="oldpwd" readonly value="${sessionScope.u.password}" />
      </div>
      <div class="form-row">
        <label>新密码</label>
        <input type="text" class="glass-input" name="newpwd" placeholder="请输入新密码" required />
      </div>
      <div style="display:flex;gap:12px;margin-top:26px;">
        <button type="submit" class="btn-glass" style="height:44px;padding:0 28px;">✅ 确认修改</button>
        <a href="home_page.jsp" class="btn-subtle" style="height:44px;display:inline-flex;align-items:center;">← 返回</a>
      </div>
    </form>
  </div>

  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>
</body>
</html>