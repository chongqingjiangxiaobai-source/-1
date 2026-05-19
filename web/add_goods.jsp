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
<body class="content-body">

<div class="page-header-bar">
  <div class="breadcrumb-bar">
    <a href="home_page.jsp">首页</a> <span>›</span>
    <a href="goods_list.jsp">仓库列表</a> <span>›</span> 添加货物
  </div>
</div>

<div class="form-panel">
  <div class="form-title">➕ 添加货物信息</div>
  <form action="addGoodsServlet" target="_parent">
    <input value="${sessionScope.u.id}" name="uid" type="hidden">
    <div class="form-row">
      <label>货物 ID</label>
      <input type="number" class="input-field" name="id" required placeholder="输入货物编号" />
    </div>
    <div class="form-row">
      <label>货物名称</label>
      <input type="text" class="input-field" name="name" required placeholder="输入货物名称" />
    </div>
    <div class="form-row">
      <label>货物数量</label>
      <input type="number" class="input-field" name="num" required placeholder="输入库存数量" />
    </div>
    <div class="form-row">
      <label>存放地点</label>
      <input type="text" class="input-field" name="site" required placeholder="输入存放位置" />
    </div>
    <div style="display:flex;gap:12px;margin-top:24px;">
      <button type="submit" class="btn-primary" style="height:40px;padding:0 32px;display:inline-flex;align-items:center;gap:6px;text-decoration:none;">
        ✅ 确认添加
      </button>
      <a href="goods_list.jsp" class="btn-default" style="height:40px;padding:0 24px;display:inline-flex;align-items:center;text-decoration:none;">
        ← 返回列表
      </a>
    </div>
  </form>
</div>

<script>
if (window !== window.top) {
  document.querySelector('form').target = '_parent';
}
</script>
</body>
</html>
