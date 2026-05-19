<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>首页 - 仓库管理系统</title>
  <link rel="stylesheet" href="css/global.css" />
  <link rel="stylesheet" href="css/home.css" />
</head>
<body class="glass-body">

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
      <span style="opacity:0.5;font-size:10px;">▼</span>
    </div>
    <div class="dropdown-menu-glass" id="userMenu">
      <a href="personal_information.jsp" class="drop-item">👤 个人信息</a>
      <a href="change_password.jsp" class="drop-item">🔑 修改密码</a>
      <div class="drop-divider"></div>
      <a href="logoutServlet" class="drop-item danger">🚪 安全退出</a>
    </div>
  </div>
</div>

<!-- 侧边栏 -->
<div class="sidebar">
  <div class="sidebar-title">导航</div>
  <a href="goods_list.jsp" class="nav-item">
    <span class="nav-icon">📋</span> 仓库列表
  </a>
  <a href="add_goods.jsp" class="nav-item">
    <span class="nav-icon">➕</span> 仓库添加
  </a>
  <a href="client.jsp" class="nav-item">
    <span class="nav-icon">👥</span> 客户信息
  </a>
  <a href="personal_information.jsp" class="nav-item">
    <span class="nav-icon">👤</span> 个人信息
  </a>
  <a href="change_password.jsp" class="nav-item">
    <span class="nav-icon">🔑</span> 修改密码
  </a>
  <div class="nav-divider"></div>
  <a href="logoutServlet" class="nav-item" style="color:rgba(224,85,85,0.7);">
    <span class="nav-icon">🚪</span> 安全退出
  </a>
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
    <span style="font-size:12px;color:#aaa;">v2.0 · 2026</span>
  </div>

  <!-- 统计卡片 -->
  <div class="stats-row">
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(12,224,147,0.12);color:#0CE093;">📦</div>
      <div class="stat-info">
        <div class="stat-num" id="stat-goods">${goods == null ? 0 : goods.size()}</div>
        <div class="stat-label">库存条目</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(59,130,246,0.12);color:#3b82f6;">👥</div>
      <div class="stat-info">
        <div class="stat-num" id="stat-clients">${client == null ? 0 : client.size()}</div>
        <div class="stat-label">客户数量</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(245,158,11,0.12);color:#f59e0b;">🕐</div>
      <div class="stat-info">
        <div class="stat-num" style="font-size:20px;line-height:1.6;">实时</div>
        <div class="stat-label">系统状态</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(139,92,246,0.12);color:#8b5cf6;">✅</div>
      <div class="stat-info">
        <div class="stat-num" style="font-size:20px;line-height:1.6;">在线</div>
        <div class="stat-label">服务状态</div>
      </div>
    </div>
  </div>

  <!-- 快捷操作 -->
  <div class="glass-card" style="padding:24px;margin-bottom:16px;">
    <div class="card-title">⚡ 快捷操作</div>
    <div style="display:flex;gap:12px;flex-wrap:wrap;">
      <a href="add_goods.jsp" class="btn-glass">➕ 添加入库</a>
      <a href="goods_list.jsp" class="btn-subtle">📋 查看库存</a>
      <a href="client.jsp" class="btn-subtle">👥 客户管理</a>
      <a href="personal_information.jsp" class="btn-subtle">👤 个人信息</a>
    </div>
  </div>

  <!-- 系统公告 -->
  <div class="glass-card" style="padding:24px;">
    <div class="card-title">📝 系统公告</div>
    <div style="display:flex;flex-direction:column;gap:8px;">
      <div class="announce-item">
        <span class="announce-dot" style="background:#0CE093;"></span>
        <span>系统运行正常，所有服务在线</span>
        <span style="margin-left:auto;font-size:11px;color:#bbb;">刚刚</span>
      </div>
      <div class="announce-item">
        <span class="announce-dot" style="background:#3b82f6;"></span>
        <span>欢迎使用仓库管理系统 v2.0 · 液态玻璃主题</span>
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
function updateTime() {
  var now = new Date();
  var s = now.toLocaleString('zh-CN', {hour12:false, year:'numeric',month:'2-digit',day:'2-digit',hour:'2-digit',minute:'2-digit',second:'2-digit'});
  document.getElementById('current-time').textContent = s;
}
updateTime();
setInterval(updateTime, 1000);

function toggleUserMenu() {
  var m = document.getElementById('userMenu');
  m.style.display = m.style.display === 'none' ? 'block' : 'none';
}
document.addEventListener('click', function(e) {
  var chip = document.querySelector('.user-chip');
  var menu = document.getElementById('userMenu');
  if (chip && !chip.contains(e.target)) menu.style.display = 'none';
});
</script>
</body>
</html>