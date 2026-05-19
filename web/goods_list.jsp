<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>仓库列表</title>
  <link rel="stylesheet" href="css/global.css" />
  <link rel="stylesheet" href="css/page.css" />
  <script src="js/jquery-3.2.1.js"></script>
  <script src="./js/xhr.js"></script>
  <script src="./js/list.js"></script>
</head>
<body class="glass-body">

<div class="main-content">
  <div class="page-header-bar">
    <div class="breadcrumb-bar">
      <a href="home_page.jsp">首页</a> <span>›</span> 仓库列表
    </div>
    <a href="add_goods.jsp" class="btn-glass">➕ 添加入库</a>
  </div>

  <!-- 搜索栏 -->
  <div class="glass-card" style="padding:20px 24px;margin-bottom:16px;">
    <div class="card-title" style="margin-bottom:14px;">🔍 库存搜索</div>
    <div style="display:flex;gap:10px;align-items:center;flex-wrap:wrap;">
      <input
        type="text"
        id="search-input"
        class="glass-input"
        placeholder="输入货物名称、ID或存放地点搜索..."
        style="flex:1;min-width:200px;height:40px;"
        oninput="filterGoods()"
      />
      <button class="btn-glass" onclick="resetSearch()" style="height:40px;padding:0 20px;">🔄 重置</button>
      <span id="search-count" style="font-size:12px;color:#888;white-space:nowrap;"></span>
    </div>
  </div>

  <div class="glass-card" style="padding:0;overflow:hidden;">
    <div class="card-title" style="padding:18px 24px;margin:0;background:rgba(12,224,147,0.05);border-radius:20px 20px 0 0;">
      📋 仓库列表
    </div>
    <div style="overflow-x:auto;padding:4px;">
      <table class="data-table" id="goods-table">
        <thead>
          <tr>
            <th style="width:36px;"><input type="checkbox" /></th>
            <th>序号</th>
            <th>货物ID</th>
            <th>货物名称</th>
            <th>数量</th>
            <th>生产地址</th>
            <th>入库时间</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody id="goods-tbody">
          <c:forEach items="${goods}" var="goodss" varStatus="v">
            <tr class="goods-row" data-id="${goodss.id}" data-name="${goodss.name}" data-site="${goodss.site}">
              <td><input type="checkbox" /></td>
              <td class="row-num">${v.index+1}</td>
              <td class="row-id">${goodss.id}</td>
              <td class="row-name">${goodss.name}</td>
              <td>${goodss.num}</td>
              <td class="row-site">${goodss.site}</td>
              <td>${goodss.time}</td>
              <td>
                <button class="btn-tbl-edit" onclick="mydetails(${goodss.id})">✏️ 修改</button>
                <button class="btn-tbl-del" onclick="myDelete(${goodss.id},${sessionScope.u.id})">🗑️ 删除</button>
              </td>
            </tr>
          </c:forEach>
          <c:if test="${empty goods}">
            <tr><td colspan="8" style="color:#aaa;padding:40px;">暂无数据</td></tr>
          </c:if>
        </tbody>
      </table>
    </div>
  </div>

  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>

<script>
function filterGoods() {
  var kw = document.getElementById('search-input').value.trim().toLowerCase();
  var rows = document.querySelectorAll('.goods-row');
  var count = 0;
  rows.forEach(function(row) {
    var id = row.getAttribute('data-id') || '';
    var name = row.getAttribute('data-name') || '';
    var site = row.getAttribute('data-site') || '';
    var hit = kw === '' || name.toLowerCase().includes(kw) || id.toLowerCase().includes(kw) || site.toLowerCase().includes(kw);
    row.style.display = hit ? '' : 'none';
    if (hit) count++;
  });
  // 重新编号
  var visibleRows = document.querySelectorAll('.goods-row:not([style*="none"])');
  visibleRows.forEach(function(row, i) {
    var numCell = row.querySelector('.row-num');
    if (numCell) numCell.textContent = i + 1;
  });
  var countEl = document.getElementById('search-count');
  if (kw === '') {
    countEl.textContent = '共 ' + rows.length + ' 条';
  } else {
    countEl.textContent = '匹配 ' + count + ' 条 / ' + rows.length + ' 条';
  }
}

function resetSearch() {
  document.getElementById('search-input').value = '';
  filterGoods();
}

// 初始化显示总数
window.addEventListener('DOMContentLoaded', function() {
  filterGoods();
});
</script>
</body>
</html>