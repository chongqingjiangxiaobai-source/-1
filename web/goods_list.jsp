<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>仓库列表</title>
  <link rel="stylesheet" href="css/global.css" />
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
    <a href="add_goods.jsp" class="btn-primary">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
      添加入库
    </a>
  </div>
  <div class="glass-card" style="padding:20px 24px;margin-bottom:16px;">
    <div class="card-title">库存搜索</div>
    <div class="search-bar" style="margin-top:4px;">
      <input type="text" id="search-input" class="glass-input" placeholder="搜索货物名称、ID 或存放地点..." oninput="filterGoods()" />
      <button class="btn-ghost" onclick="resetSearch()" style="height:40px;padding:0 16px;">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="1 4 1 10 7 10"/><path d="M3.51 15a9 9 0 1 0 .49-3"/></svg>
        重置
      </button>
      <span id="search-count" class="search-count"></span>
    </div>
  </div>
  <div class="glass-card" style="padding:0;overflow:hidden;">
    <div class="panel-header">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>
      仓库列表
    </div>
    <div class="table-wrap">
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
                <button class="btn-tbl-edit" onclick="mydetails(${goodss.id})">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
                  修改
                </button>
                <button class="btn-tbl-del" onclick="myDelete(${goodss.id},${sessionScope.u.id})">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg>
                  删除
                </button>
              </td>
            </tr>
          </c:forEach>
          <c:if test="${empty goods}">
            <tr><td colspan="8" style="color:var(--color-text-3);padding:48px;">暂无数据</td></tr>
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
  var visibleRows = document.querySelectorAll('.goods-row:not([style*="none"])');
  visibleRows.forEach(function(row, i) {
    var numCell = row.querySelector('.row-num');
    if (numCell) numCell.textContent = i + 1;
  });
  var countEl = document.getElementById('search-count');
  countEl.textContent = kw === '' ? '共 ' + rows.length + ' 条' : '匹配 ' + count + ' 条 / ' + rows.length + ' 条';
}
function resetSearch() { document.getElementById('search-input').value = ''; filterGoods(); }
window.addEventListener('DOMContentLoaded', function() { filterGoods(); });
</script>
</body>
</html>
