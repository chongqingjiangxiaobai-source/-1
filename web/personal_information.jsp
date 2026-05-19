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
<body class="content-body">

<div class="page-header-bar">
  <div class="breadcrumb-bar">
    <a href="home_page.jsp">首页</a> <span>›</span> 个人信息
  </div>
  <a href="change_password.jsp" class="btn-primary" style="display:inline-flex;align-items:center;gap:6px;text-decoration:none;">
    🔑 修改密码
  </a>
</div>

<div class="form-panel" style="max-width:520px;">
  <div class="form-title">👤 个人信息</div>
  <table class="data-table" style="margin-top:8px;">
    <tr>
      <th style="background:#f5f7fa;text-align:right;width:120px;color:#888;">管理员ID</th>
      <td style="text-align:left;padding-left:20px;">${u.id}</td>
    </tr>
    <tr>
      <th style="background:#f5f7fa;text-align:right;color:#888;">账号</th>
      <td style="text-align:left;padding-left:20px;">${u.username}</td>
    </tr>
    <tr>
      <th style="background:#f5f7fa;text-align:right;color:#888;">年龄</th>
      <td style="text-align:left;padding-left:20px;">${u.age}</td>
    </tr>
    <tr>
      <th style="background:#f5f7fa;text-align:right;color:#888;">性别</th>
      <td style="text-align:left;padding-left:20px;">${u.gender}</td>
    </tr>
  </table>
  <div style="margin-top:24px;display:flex;gap:12px;">
    <a href="change_password.jsp" class="btn-primary" style="height:36px;display:inline-flex;align-items:center;gap:6px;text-decoration:none;">
      🔑 修改密码
    </a>
    <a href="home_page.jsp" class="btn-default" style="height:36px;display:inline-flex;align-items:center;text-decoration:none;">
      ← 返回首页
    </a>
  </div>
</div>

</body>
</html>
