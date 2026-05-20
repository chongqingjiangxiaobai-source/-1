<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>个人信息</title>
  <link rel="stylesheet" href="css/global.css" />
  <script src="js/jquery-3.2.1.js"></script>
</head>
<body class="glass-body">
<div class="main-content">
  <div class="page-header-bar">
    <div class="breadcrumb-bar">
      <a href="home_page.jsp">首页</a> <span>›</span> 个人信息
    </div>
    <a href="change_password.jsp" class="btn-primary">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
      修改密码
    </a>
  </div>
  <div class="glass-card" style="padding:32px;max-width:520px;">
    <div class="card-title">个人信息</div>
    <table class="data-table" style="margin-top:8px;">
      <tbody>
        <tr>
          <th style="text-align:right;padding-right:20px;width:110px;color:var(--color-text-3);">管理员ID</th>
          <td style="text-align:left;padding-left:20px;font-weight:600;">${u.id}</td>
        </tr>
        <tr>
          <th style="text-align:right;padding-right:20px;color:var(--color-text-3);">账号</th>
          <td style="text-align:left;padding-left:20px;font-weight:600;">${u.username}</td>
        </tr>
        <tr>
          <th style="text-align:right;padding-right:20px;color:var(--color-text-3);">年龄</th>
          <td style="text-align:left;padding-left:20px;font-weight:600;">${u.age}</td>
        </tr>
        <tr>
          <th style="text-align:right;padding-right:20px;color:var(--color-text-3);">性别</th>
          <td style="text-align:left;padding-left:20px;font-weight:600;">${u.gender}</td>
        </tr>
      </tbody>
    </table>
    <div style="margin-top:24px;display:flex;gap:10px;">
      <a href="change_password.jsp" class="btn-primary" style="height:40px;padding:0 20px;">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
        修改密码
      </a>
      <a href="home_page.jsp" class="btn-ghost" style="height:40px;display:inline-flex;align-items:center;padding:0 18px;">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="19" y1="12" x2="5" y2="12"/><polyline points="12 19 5 12 12 5"/></svg>
        返回首页
      </a>
    </div>
  </div>
  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>
</body>
</html>
