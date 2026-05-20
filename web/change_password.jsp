<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>修改密码</title>
  <link rel="stylesheet" href="css/global.css" />
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
  <div class="glass-card" style="padding:32px;max-width:520px;">
    <div class="card-title">修改密码</div>
    <form action="changePasswordServlet" target="_parent" style="margin-top:8px;">
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
      <div style="display:flex;gap:10px;margin-top:24px;">
        <button type="submit" class="btn-primary" style="height:44px;padding:0 28px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
          确认修改
        </button>
        <a href="home_page.jsp" class="btn-ghost" style="height:44px;display:inline-flex;align-items:center;padding:0 18px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="19" y1="12" x2="5" y2="12"/><polyline points="12 19 5 12 12 5"/></svg>
          返回
        </a>
      </div>
    </form>
  </div>
  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>
</body>
</html>
