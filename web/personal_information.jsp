<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>个人信息</title>
  <link rel="stylesheet" href="css/global.css" />
  <link rel="stylesheet" href="css/page.css" />
  <script src="js/jquery-3.2.1.js"></script>
  <script src="./js/xhr.js"></script>
</head>
<body class="glass-body">

<div class="main-content">
  <div class="page-header-bar">
    <div class="breadcrumb-bar">
      <a href="home_page.jsp">首页</a> <span>›</span> 个人信息
    </div>
    <a href="change_password.jsp" class="btn-glass">🔑 修改密码</a>
  </div>

  <div class="glass-card" style="padding:32px;max-width:520px;">
    <div class="card-title">👤 个人信息</div>
    <table class="data-table">
      <tr>
        <th style="text-align:right;padding-right:20px;width:110px;color:#888;">管理员ID</th>
        <td style="text-align:left;padding-left:20px;">${u.id}</td>
      </tr>
      <tr>
        <th style="text-align:right;padding-right:20px;color:#888;">账号</th>
        <td style="text-align:left;padding-left:20px;">${u.username}</td>
      </tr>
      <tr>
        <th style="text-align:right;padding-right:20px;color:#888;">年龄</th>
        <td style="text-align:left;padding-left:20px;">${u.age}</td>
      </tr>
      <tr>
        <th style="text-align:right;padding-right:20px;color:#888;">性别</th>
        <td style="text-align:left;padding-left:20px;">${u.gender}</td>
      </tr>
    </table>
    <div style="margin-top:26px;display:flex;gap:12px;">
      <a href="change_password.jsp" class="btn-glass">🔑 修改密码</a>
      <a href="home_page.jsp" class="btn-subtle">← 返回首页</a>
    </div>
  </div>

  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>
</body>
</html>