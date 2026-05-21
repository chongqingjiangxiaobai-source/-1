# 仓库管理系统

📦 基于 JavaWeb 的仓库管理系统，支持货物管理、客户管理、用户权限等完整功能。

## 项目简介

本系统采用 Java Servlet + JSP + MySQL 技术栈开发，提供完整的仓库管理功能，包括：
- 货物信息的增删改查
- 客户信息管理
- 用户注册登录
- 管理员密码修改
- 库存实时搜索

## 技术栈

| 分类 | 技术 |
|------|------|
| 后端 | Java / Servlet / JSP |
| 前端 | HTML / CSS / JavaScript / AJAX |
| UI 风格 | 液态玻璃光影质感主题（Glassmorphism） |
| 数据库 | MySQL |
| 服务器 | Tomcat 9 |
| 容器化 | Docker / Docker Compose |

## 项目结构

```
warehouse-management-system/
├── src/
│   └── com/potato/
│       ├── controller/    # Servlet 控制器
│       ├── dao/            # 数据访问层
│       ├── entity/         # 实体类
│       ├── filter/         # 过滤器（字符编码）
│       ├── service/        # 业务逻辑层
│       └── util/           # 工具类
├── web/                  # Web 资源（IDE 开发时使用）
├── webapps/
│   └── warehouse/        # 已编译部署版本（含 class + lib）
├── docker/
│   ├── jdbc.properties   # Docker 环境专用配置
│   └── sql/
│       └── init.sql      # MySQL 数据库初始化脚本
├── Dockerfile            # Web 应用镜像构建
├── docker-compose.yml    # 容器编排配置
├── build-docker.sh       # 一键构建脚本
└── .dockerignore         # Docker 构建排除
```

## 功能模块

### 🔐 用户模块
- 用户注册（表单验证 + AJAX 异步校验用户名唯一性）
- 用户登录（AJAX + JSON 交互）
- 密码修改

### 📦 仓库管理
- 货物列表展示（支持实时搜索过滤）
- 添加货物信息
- 修改货物信息
- 删除货物（修复 redirect 路径问题）
- **库存搜索**：按货物名称、ID、存放地点实时过滤

### 👥 客户管理 人数不够没做
- 客户列表展示
- 修改客户信息
- 删除客户信息

## 数据库 ER 图

![ER Diagram](er-diagram.png)

## 界面预览

系统采用**液态玻璃光影质感主题**，设计特点：
- 浅色柔和背景 + 白色玻璃态卡片
- 卡片顶部光泽条 + 左边缘高光，模拟玻璃厚度感
- 主色调 `#0CE093`（绿色）贯穿所有交互元素
- 统计卡片 Dashboard，实时显示库存条目和客户数量
- 响应式布局，适配不同屏幕

## 在线演示

> ⚠️ 不要开源，以防暴露服务器ip和端口号

| 环境 | 传统部署地址 | Docker 部署地址 |
|------|-------------|----------------|
| [登录页](http://123.207.205.179:3000/warehouse/login.html) | `[http://<HOST>:<PORT>/warehouse/login.html]` | `http://<HOST>:<PORT>/login.html` |
| [注册页](http://123.207.205.179:3000/warehouse/reg.html) | `[http://<HOST>:<PORT>/warehouse/reg.html]` | `http://<HOST>:<PORT>/reg.html` |
| 首页 | `http://<HOST>:<PORT>/warehouse/home_page.jsp` | `http://<HOST>:<PORT>/home_page.jsp` |

## 快速开始

### 方式一：Docker 部署（推荐）（但机房电脑没有安装Docker故废弃）

#### 环境要求
- Docker 20.10+
- Docker Compose 2.0+

#### 一键启动

```bash
cd warehouse-management-system
./build-docker.sh
```

或手动构建：

```bash
docker-compose up -d --build
```

#### 访问地址

| 环境 | 地址 |
|------|------|
| 登录页 | http://localhost:8080/warehouse/login.html |
| 注册页 | http://localhost:8080/warehouse/reg.html |
| 首页 | http://localhost:8080/warehouse/home_page.jsp |

> ⚠️ 若宿主机 8080 端口被占用，docker-compose 会自动使用 8081 端口

#### 常用操作

```bash
# 查看容器状态
docker-compose ps

# 查看应用日志
docker logs warehouse_web -f

# 重新构建（代码更新后）
docker-compose up -d --build

# 停止并删除容器
docker-compose down

# 完全重置（清除数据）
docker-compose down -v
```

#### 数据持久化

MySQL 数据存储在 Docker volume 中，删除容器不会丢失数据。

---

### 方式二：传统部署（Tomcat + MySQL）

#### 环境要求
- JDK 8+
- MySQL 5.7+
- Tomcat 9+

#### 数据库配置

```sql
CREATE DATABASE warehouse DEFAULT CHARACTER SET utf8mb4;
USE warehouse;

CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE goods (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    num INT,
    site VARCHAR(200),
    time TIMESTAMP
);

CREATE TABLE client (
    clientId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    goodsId INT,
    goodsNum INT
);

CREATE TABLE goods_id (
    uid INT,
    id INT,
    clientId INT
);
```

#### 数据库连接配置

编辑 `src/com/potato/util/jdbc.properties`：
```properties
username=root
pwd=你的MySQL密码
url=jdbc:mysql://localhost:3306/warehouse?serverTimezone=Asia/Shanghai
driverName=com.mysql.cj.jdbc.Driver
```

> ⚠️ **Docker 部署时**请使用 `docker/jdbc.properties`，host 已配置为 `mysql` 或宿主机 IP

#### 部署运行

**方式一：IDE 部署**
1. 将项目导入 IntelliJ IDEA / Eclipse
2. 配置 Tomcat 9 服务器
3. 运行并访问 `http://localhost:8080/warehouse/`

**方式二：WAR 包部署**
1. 将已编译的 `webapps/warehouse/` 目录复制到 Tomcat webapps 目录
2. 重启 Tomcat 访问

**方式三：Docker 部署**
见上方「方式一：Docker 部署」

#### 首次使用

1. 访问注册页面创建管理员账号
2. 注册完成后自动跳转登录页
3. 使用注册的账号密码登录系统

## 页面说明

| 页面 | 文件 | 说明 |
|------|------|------|
| 登录页 | `login.html` | 用户登录入口，液态玻璃风格 + 反重力粒子特效 |
| 注册页 | `reg.html` | 管理员账号注册 |
| 首页 | `home_page.jsp` | Dashboard，统计卡片 + 快捷操作 + 系统公告 |
| 仓库列表 | `goods_list.jsp` | 货物管理页面，含实时搜索引擎 |
| 添加货物 | `add_goods.jsp` | 新增货物 |
| 修改货物 | `modify.jsp` | 编辑货物信息 |
| 客户管理 | `client.jsp` | 客户信息管理（人手不够，功能写死以后再说） |
| 个人信息 | `personal_information.jsp` | 管理员信息 |
| 修改密码 | `change_password.jsp` | 修改登录密码 |

## 问题修复记录

| 编号 | 问题 | 修复方案 |
|------|------|----------|
| 1 | DBUtils 硬编码 Windows 路径 | 改用 ClassLoader 加载 classpath 下资源 |
| 2 | DAO 层实例变量线程安全隐患 | conn/ps/rs 改为方法内局部变量 |
| 3 | SQL 语句硬编码数据库前缀 | 移除所有 `warehouse.` 前缀 |
| 4 | LoginServlet 重复数据库查询 | 优化为单次查询，Session 共用 User 对象 |
| 5 | GoodsDaoImpl 列名大小写错误 | `Site` → `site` |
| 6 | 表单验证逻辑不完整 | 增加确认密码校验 + 提交拦截 |
| 7 | AJAX 路径使用绝对路径 | 改为相对路径，兼容不同部署环境 |
| 8 | DeleteGoodsServlet 删除后 404 | redirect 路径添加 `req.getContextPath()` |
| 9 | 首页统计卡片显示固定符号 | 改为 `${goods.size()}` / `${client.size()}` 实时取值 |
| 10 | 仓库列表无法快速查找 | 增加前端实时搜索，支持按名称/ID/地点过滤 |

## 项目特色

- ✅ **分层架构**：Controller / Service / DAO 三层分离
- ✅ **线程安全**：数据库连接等资源正确管理
- ✅ **配置分离**：数据库配置外部化，易于部署
- ✅ **前后端分离**：AJAX + JSON 实现无刷新交互
- ✅ **表单验证**：前端 JS 实时校验 + 后端验证双重保障
- ✅ **UI 主题**：液态玻璃光影质感，全端风格统一（伪-只做了登录页，后面太难捣鼓没做）
- ✅ **实时搜索**：前端 JS 过滤，无需刷新页面
- ✅ **容器化部署**：支持 Docker / Docker Compose 一键部署

## License

MIT License © 2026 枣庄学院