<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>首页 - 仓库管理系统</title>
  <link rel="stylesheet" href="css/global.css" />
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
      <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="6 9 12 15 18 9"/></svg>
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
  <a href="home_page.jsp" class="nav-item active">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
    仪表盘
  </a>
  <a href="goods_list.jsp" class="nav-item">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>
    仓库列表
  </a>
  <a href="add_goods.jsp" class="nav-item">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
    仓库添加
  </a>
  <a href="client.jsp" class="nav-item">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
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
    <div>
      <div class="page-title">欢迎回来，<span>${sessionScope.u.username}</span></div>
      <div class="breadcrumb-bar" style="margin-top:5px;">
        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
        <span id="current-time"></span>
      </div>
    </div>
    <span style="font-size:11px;color:var(--color-text-3);letter-spacing:1px;">v2.0 · 2026</span>
  </div>

  <div class="stats-row">
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(37,99,235,0.08);">
        <svg viewBox="0 0 24 24" fill="none" stroke="#2563eb" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>
      </div>
      <div class="stat-info">
        <div class="stat-num">${goods == null ? 0 : goods.size()}</div>
        <div class="stat-label">库存条目</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(5,150,105,0.08);">
        <svg viewBox="0 0 24 24" fill="none" stroke="#059669" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
      </div>
      <div class="stat-info">
        <div class="stat-num">${client == null ? 0 : client.size()}</div>
        <div class="stat-label">客户数量</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(217,119,6,0.08);">
        <svg viewBox="0 0 24 24" fill="none" stroke="#d97706" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
      </div>
      <div class="stat-info">
        <div class="stat-num" style="font-size:20px;color:var(--color-text-2);">实时</div>
        <div class="stat-label">系统时间</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon" style="background:rgba(37,99,235,0.08);">
        <svg viewBox="0 0 24 24" fill="none" stroke="#2563eb" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
      </div>
      <div class="stat-info">
        <div class="stat-num" style="font-size:20px;color:var(--color-success);">在线</div>
        <div class="stat-label">服务状态</div>
      </div>
    </div>
  </div>

  <div class="glass-card" style="padding:24px;margin-bottom:16px;">
    <div class="card-title">快捷操作</div>
    <div style="display:flex;gap:10px;flex-wrap:wrap;margin-top:4px;">
      <a href="add_goods.jsp" class="btn-primary">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        添加入库
      </a>
      <a href="goods_list.jsp" class="btn-ghost">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>
        查看库存
      </a>
      <a href="client.jsp" class="btn-ghost">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>
        客户管理
      </a>
    </div>
  </div>

  <div class="glass-card" style="padding:24px;">
    <div class="card-title">系统公告</div>
    <div>
      <div class="announce-item">
        <span class="announce-dot" style="background:#059669;"></span>
        <span>系统运行正常，所有服务在线</span>
        <span class="announce-time">刚刚</span>
      </div>
      <div class="announce-item">
        <span class="announce-dot" style="background:#2563eb;"></span>
        <span>欢迎使用仓库管理系统 v2.0</span>
        <span class="announce-time">今天</span>
      </div>
      <div class="announce-item">
        <span class="announce-dot" style="background:#d97706;"></span>
        <span>定期盘点库存，保持数据准确</span>
        <span class="announce-time">3 天前</span>
      </div>
    </div>
  </div>

  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>

<script src="js/jquery-3.2.1.js"></script>
<script>
function updateTime() {
  var now = new Date();
  var s = now.toLocaleString('zh-CN', {hour12:false,year:'numeric',month:'2-digit',day:'2-digit',hour:'2-digit',minute:'2-digit',second:'2-digit'});
  document.getElementById('current-time').textContent = s;
}
updateTime(); setInterval(updateTime, 1000);

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
