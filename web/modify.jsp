<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>货物修改</title>
  <link rel="stylesheet" href="css/global.css" />
  <link rel="stylesheet" href="css/page.css" />
  <script src="js/jquery-3.2.1.js"></script>
  <script src="layer/layer.js"></script>
  <script src="./js/xhr.js"></script>
  <script src="./js/list.js"></script>
</head>
<body class="content-body">

<div class="page-header-bar">
  <div class="breadcrumb-bar">
    <a href="home_page.jsp">首页</a> <span>›</span>
    <a href="goods_list.jsp">仓库列表</a> <span>›</span> 货物修改
  </div>
</div>

<div class="form-panel" style="max-width:560px;">
  <div class="form-title">✏️ 货物信息修改</div>
  <form action="updateGoodsServlet" target="_parent">
    <input value="${sessionScope.u.id}" name="uid" type="hidden">

    <div class="form-row">
      <label>货物 ID</label>
      <input type="text" class="input-field" name="id" value="${g.id}" readonly style="background:#f5f5f5;color:#888;" />
    </div>
    <div class="form-row">
      <label>货物名称</label>
      <input type="text" class="input-field" name="name" value="${g.name}" />
    </div>
    <div class="form-row">
      <label>货物数量</label>
      <input type="text" class="input-field" name="num" value="${g.num}" />
    </div>
    <div class="form-row">
      <label>生产地址</label>
      <input type="text" class="input-field" name="site" value="${g.site}" readonly style="background:#f5f5f5;color:#888;" />
    </div>
    <div class="form-row">
      <label>入库时间</label>
      <input type="text" class="input-field" name="uploadTime" value="${g.time}" readonly style="background:#f5f5f5;color:#888;" />
    </div>

    <div style="display:flex;gap:12px;margin-top:24px;">
      <button type="submit" class="btn-primary" style="height:40px;padding:0 28px;display:inline-flex;align-items:center;gap:6px;">
        ✅ 确认修改
      </button>
      <a href="goods_list.jsp" class="btn-default" style="height:40px;padding:0 20px;display:inline-flex;align-items:center;text-decoration:none;">
        ← 返回
      </a>
    </div>
  </form>
</div>
</body>
</html>
