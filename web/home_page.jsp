<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>首页 - 仓库管理系统</title>
  <link rel="stylesheet" href="css/global.css" />
  <link rel="stylesheet" href="css/home.css" />
</head>
<body class="dashboard-body">

<!-- 顶部导航 -->
<div class="top-nav">
  <div class="brand">
    <div class="brand-icon">📦</div>
    仓库管理系统
  </div>
  <div class="nav-right">
    <div class="user-chip" onclick="toggleUserMenu()">
      <div class="user-avatar">${sessionScope.u.username.substring(0,1)}</div>
      <span>${sessionScope.u.username}</span>
      <span style="opacity:0.4;font-size:10px;">▼</span>
    </div>
    <div class="dropdown-menu-mini" id="userMenu" style="display:none;position:absolute;top:58px;right:20px;background:#243447;border-radius:10px;padding:8px 0;min-width:160px;box-shadow:0 8px 24px rgba(0,0,0,0.3);z-index:9999;">
      <a href="personal_information.jsp" class="dropdown-item">👤 个人信息</a>
      <a href="change_password.jsp" class="dropdown-item">🔑 修改密码</a>
      <div style="height:1px;background:rgba(255,255,255,0.1);margin:6px 0;"></div>
      <a href="logoutServlet" class="dropdown-item" style="color:#ff6b6b;">🚪 安全退出</a>
    </div>
  </div>
</div>

<!-- 侧边栏 -->
<div class="sidebar">
  <div class="sidebar-title">导航菜单</div>
  <a href="goods_list.jsp" class="nav-item" onclick="navigate('goods_list.jsp', this)">
    <span class="nav-icon">📋</span> 仓库列表
  </a>
  <a href="add_goods.jsp" class="nav-item" onclick="navigate('add_goods.jsp', this)">
    <span class="nav-icon">➕</span> 仓库添加
  </a>
  <a href="client.jsp" class="nav-item" onclick="navigate('client.jsp', this)">
    <span class="nav-icon">👥</span> 客户信息
  </a>
  <a href="personal_information.jsp" class="nav-item" onclick="navigate('personal_information.jsp', this)">
    <span class="nav-icon">👤</span> 个人信息
  </a>
  <a href="change_password.jsp" class="nav-item" onclick="navigate('change_password.jsp', this)">
    <span class="nav-icon">🔑</span> 修改密码
  </a>

  <div style="position:absolute;bottom:20px;left:0;right:0;padding:0 20px;">
    <a href="logoutServlet" class="nav-item" style="color:rgba(255,107,107,0.7);">
      <span class="nav-icon">🚪</span> 安全退出
    </a>
  </div>
</div>

<!-- 主内容区 -->
<div class="main-content">
  <!-- 欢迎栏 -->
  <div class="page-header-bar">
    <div>
      <div class="page-title">👋 欢迎回来，<span>${sessionScope.u.username}</span></div>
      <div class="breadcrumb-bar" style="margin-top:6px;">
        <span>📅</span> <span id="current-time"></span>
      </div>
    </div>
    <div style="display:flex;gap:10px;align-items:center;">
      <span style="font-size:12px;color:#888;">v2.0 · 2026</span>
    </div>
  </div>

  <!-- 统计卡片 -->
  <div class="stats-row">
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(12,224,147,0.12);color:#0CE093;">📦</div>
      <div class="stat-info">
        <div class="stat-num" id="stat-goods">--</div>
        <div class="stat-label">库存条目</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(59,130,246,0.12);color:#3b82f6;">👥</div>
      <div class="stat-info">
        <div class="stat-num" id="stat-clients">--</div>
        <div class="stat-label">客户数量</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(245,158,11,0.12);color:#f59e0b;">🕐</div>
      <div class="stat-info">
        <div class="stat-num" style="font-size:14px;line-height:1.8;">实时</div>
        <div class="stat-label">系统状态</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(139,92,246,0.12);color:#8b5cf6;">✅</div>
      <div class="stat-info">
        <div class="stat-num" style="font-size:14px;line-height:1.8;">在线</div>
        <div class="stat-label">服务状态</div>
      </div>
    </div>
  </div>

  <!-- 快捷操作 -->
  <div class="dash-card">
    <div class="card-title">⚡ 快捷操作</div>
    <div style="display:flex;gap:12px;flex-wrap:wrap;">
      <a href="add_goods.jsp" class="btn-primary" style="display:inline-flex;align-items:center;gap:6px;">
        ➕ 添加入库
      </a>
      <a href="goods_list.jsp" class="btn-default" style="display:inline-flex;align-items:center;gap:6px;">
        📋 查看库存
      </a>
      <a href="client.jsp" class="btn-default" style="display:inline-flex;align-items:center;gap:6px;">
        👥 客户管理
      </a>
      <a href="personal_information.jsp" class="btn-default" style="display:inline-flex;align-items:center;gap:6px;">
        👤 个人信息
      </a>
    </div>
  </div>

  <!-- 最近操作记录 -->
  <div class="dash-card">
    <div class="card-title">📝 系统公告</div>
    <div style="display:flex;flex-direction:column;gap:10px;">
      <div class="announce-item">
        <span class="announce-dot" style="background:#0CE093;"></span>
        <span>系统运行正常，所有服务在线</span>
        <span style="margin-left:auto;font-size:11px;color:#bbb;">刚刚</span>
      </div>
      <div class="announce-item">
        <span class="announce-dot" style="background:#3b82f6;"></span>
        <span>欢迎使用仓库管理系统 v2.0</span>
        <span style="margin-left:auto;font-size:11px;color:#bbb;">今天</span>
      </div>
      <div class="announce-item">
        <span class="announce-dot" style="background:#f59e0b;"></span>
        <span>定期盘点库存，保持数据准确</span>
        <span style="margin-left:auto;font-size:11px;color:#bbb;">3 天前</span>
      </div>
    </div>
  </div>

  <div class="footer-copyright">
    © 2026 枣庄学院 仓库管理系统 Warehouse Management System
  </div>
</div>

<script src="js/jquery-3.2.1.js"></script>
<script>
// 时间
function updateTime() {
  var now = new Date();
  var s = now.toLocaleString('zh-CN', {hour12:false, year:'numeric',month:'2-digit',day:'2-digit',hour:'2-digit',minute:'2-digit',second:'2-digit'});
  document.getElementById('current-time').textContent = s;
}
updateTime();
setInterval(updateTime, 1000);

// 用户菜单
function toggleUserMenu() {
  var m = document.getElementById('userMenu');
  m.style.display = m.style.display === 'none' ? 'block' : 'none';
}
document.addEventListener('click', function(e) {
  var chip = document.querySelector('.user-chip');
  var menu = document.getElementById('userMenu');
  if (!chip.contains(e.target)) menu.style.display = 'none';
});
</script>
</body>
</html>
