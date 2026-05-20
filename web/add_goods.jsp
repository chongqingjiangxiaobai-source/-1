<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>仓库添加</title>
  <link rel="stylesheet" href="css/global.css" />
  <script src="js/jquery-3.2.1.js"></script>
  <script src="layer/layer.js"></script>
</head>
<body class="glass-body">

<div class="top-nav">
  <div class="brand">
    <div class="brand-icon">
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
        <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/>
      </svg>
    </div>
    仓库管理系统
  </div>
  <div class="nav-right">
    <div class="user-chip" onclick="toggleUserMenu()">
      <div class="user-avatar">${sessionScope.u.username.substring(0,1)}</div>
      <span>${sessionScope.u.username}</span>
    </div>
    <div class="dropdown-menu-glass" id="userMenu">
      <a href="personal_information.jsp" class="drop-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
        个人信息
      </a>
      <a href="change_password.jsp" class="drop-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
        修改密码
      </a>
      <div class="drop-divider"></div>
      <a href="logoutServlet" class="drop-item danger">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
        安全退出
      </a>
    </div>
  </div>
</div>

<div class="sidebar">
  <div class="sidebar-title">导航</div>
  <a href="home_page.jsp" class="nav-item">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
    仪表盘
  </a>
  <a href="goods_list.jsp" class="nav-item">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>
    仓库列表
  </a>
  <a href="add_goods.jsp" class="nav-item active">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
    仓库添加
  </a>
  <a href="client.jsp" class="nav-item">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>
    客户信息
  </a>
  <a href="personal_information.jsp" class="nav-item">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
    个人信息
  </a>
  <a href="change_password.jsp" class="nav-item">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
    修改密码
  </a>
  <div class="nav-divider"></div>
  <a href="logoutServlet" class="nav-item" style="color:rgba(220,38,38,0.6);">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
    安全退出
  </a>
</div>

<div class="main-content">
  <div class="page-header-bar">
    <div class="breadcrumb-bar">
      <a href="home_page.jsp">首页</a> <span>›</span> 仓库添加
    </div>
  </div>

  <div class="glass-card" style="padding:32px;max-width:560px;">
    <div class="card-title">添加货物</div>
    <form id="addGoodsForm" style="margin-top:8px;">
      <input value="${sessionScope.u.id}" name="uid" type="hidden">
      <div class="form-row">
        <label>货物 ID</label>
        <input type="text" class="glass-input" name="id" placeholder="输入货物编号" required />
      </div>
      <div class="form-row">
        <label>货物名称</label>
        <input type="text" class="glass-input" name="name" placeholder="输入货物名称" required />
      </div>
      <div class="form-row">
        <label>货物数量</label>
        <input type="text" class="glass-input" name="num" placeholder="输入库存数量" required />
      </div>
      <div class="form-row">
        <label>生产地址</label>
        <input type="text" class="glass-input" name="site" placeholder="输入生产地址" required />
      </div>
      <div style="display:flex;gap:10px;margin-top:24px;">
        <button id="btn" type="submit" class="btn-primary" style="height:44px;padding:0 28px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
          确认添加
        </button>
        <a href="goods_list.jsp" class="btn-ghost" style="height:44px;display:inline-flex;align-items:center;padding:0 18px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="19" y1="12" x2="5" y2="12"/><polyline points="12 19 5 12 12 5"/></svg>
          返回
        </a>
      </div>
    </form>
  </div>

  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>

<script>
$(function() {
  $("#addGoodsForm").submit(function(e) {
    e.preventDefault();
    $("#btn").prop("disabled", true).css("opacity", "0.6");
    $.ajax({
      url: 'addGoodsServlet',
      type: 'GET',
      data: $(this).serialize(),
      success: function(res) {
        layer.msg('添加成功', { icon: 1, time: 1200 }, function() { window.location.href = "goods_list.jsp"; });
      },
      error: function() {
        layer.msg('添加失败，请重试', { icon: 2 });
        $("#btn").prop("disabled", false).css("opacity", "1");
      }
    });
  });
  window.toggleUserMenu = function() {
    var m = document.getElementById('userMenu');
    m.style.display = m.style.display === 'none' ? 'block' : 'none';
  };
  document.addEventListener('click', function(e) {
    var chip = document.querySelector('.user-chip');
    var menu = document.getElementById('userMenu');
    if (chip && !chip.contains(e.target)) menu.style.display = 'none';
  });
});
</script>
</body>
</html>
