<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>添加货物</title>
  <link rel="stylesheet" href="css/global.css" />
  <link rel="stylesheet" href="css/page.css" />
  <script src="js/jquery-3.2.1.js"></script>
  <script src="layer/layer.js"></script>
</head>
<body class="glass-body">

<div class="main-content">
  <div class="page-header-bar">
    <div class="breadcrumb-bar">
      <a href="home_page.jsp">首页</a> <span>›</span>
      <a href="goods_list.jsp">仓库列表</a> <span>›</span> 添加货物
    </div>
  </div>

  <div class="glass-card glass-form" style="padding:32px;">
    <div class="card-title">➕ 添加货物信息</div>
    <form action="addGoodsServlet" target="_parent">
      <input value="${sessionScope.u.id}" name="uid" type="hidden">
      <div class="form-row">
        <label>货物 ID</label>
        <input type="number" class="glass-input" name="id" required placeholder="输入货物编号" />
      </div>
      <div class="form-row">
        <label>货物名称</label>
        <input type="text" class="glass-input" name="name" required placeholder="输入货物名称" />
      </div>
      <div class="form-row">
        <label>货物数量</label>
        <input type="number" class="glass-input" name="num" required placeholder="输入库存数量" />
      </div>
      <div class="form-row">
        <label>存放地点</label>
        <input type="text" class="glass-input" name="site" required placeholder="输入存放位置" />
      </div>
      <div style="display:flex;gap:12px;margin-top:26px;">
        <button type="submit" class="btn-glass" style="height:44px;padding:0 30px;">✅ 确认添加</button>
        <a href="goods_list.jsp" class="btn-subtle" style="height:44px;display:inline-flex;align-items:center;">← 返回列表</a>
      </div>
    </form>
  </div>

  <div class="footer-copyright">© 2026 枣庄学院 仓库管理系统</div>
</div>

<script>
if (window !== window.top) {
  document.querySelector('form').target = '_parent';
}
</script>
</body>
</html>