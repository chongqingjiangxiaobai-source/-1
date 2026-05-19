# 仓库管理系统

📦 基于 JavaWeb 的仓库管理系统，支持货物管理、客户管理、用户权限等功能。

## 项目简介

本系统采用 Java Servlet + JSP + MySQL 技术栈开发，提供完整的仓库管理功能，包括：
- 货物信息的增删改查
- 客户信息管理
- 用户注册登录
- 管理员密码修改

## 技术栈

| 分类 | 技术 |
|------|------|
| 后端 | Java / Servlet / JSP |
| 前端 | HTML / CSS / JavaScript / Bootstrap |
| 数据库 | MySQL |
| 服务器 | Tomcat 9 |

## 项目结构

```
warehouse-management-system/
├── src/
│   └── com/potato/
│       ├── controller/    # Servlet 控制器
│       ├── dao/           # 数据访问层
│       ├── entity/        # 实体类
│       ├── filter/        # 过滤器
│       ├── service/       # 业务逻辑层
│       └── util/          # 工具类
├── web/
│   ├── WEB-INF/          # Web 配置
│   ├── js/               # 前端 JavaScript
│   ├── css/              # 样式文件
│   ├── img/              # 图片资源
│   ├── bootstrap/        # Bootstrap 框架
│   ├── layer/            # 弹窗插件
│   └── *.jsp/html        # 页面文件
└── pom.xml               # Maven 配置
```

## 功能模块

### 🔐 用户模块
- 用户注册（表单验证 + AJAX 异步校验用户名唯一性）
- 用户登录（AJAX + JSON 交互）
- 密码修改

### 📦 仓库管理
- 货物列表展示
- 添加货物信息
- 修改货物信息
- 删除货物

### 👥 客户管理
- 客户列表展示
- 修改客户信息
- 删除客户信息

## 在线演示

> ⚠️ **提示**：将下方链接中的 `<YOUR_HOST>` 和 `<PORT>` 替换为你的服务器地址和端口

| 环境 | 地址 |
|------|------|
| 主站 | `http://<YOUR_HOST>:<PORT>/warehouse/login.html` |
| 注册页 | `http://<YOUR_HOST>:<PORT>/warehouse/reg.html` |

### 示例（假设部署在本地 8080 端口）
```
http://localhost:8080/warehouse/login.html
```

### 快速开始

#### 1. 环境要求
- JDK 8+
- MySQL 5.7+
- Tomcat 9+

#### 2. 数据库配置

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

#### 3. 数据库连接配置

编辑 `src/com/potato/util/jdbc.properties`：
```properties
username=root
pwd=你的MySQL密码
url=jdbc:mysql://localhost:3306/warehouse?serverTimezone=Asia/Shanghai
driverName=com.mysql.cj.jdbc.Driver
```

#### 4. 部署运行

**方式一：IDE 部署**
1. 将项目导入 IntelliJ IDEA / Eclipse
2. 配置 Tomcat 9 服务器
3. 运行并访问 `http://localhost:8080/warehouse/`

**方式二：WAR 包部署**
1. 使用 Maven 打包：`mvn clean package`
2. 将生成的 WAR 包复制到 Tomcat webapps 目录
3. 重启 Tomcat 访问

#### 5. 首次使用

1. 访问注册页面创建管理员账号
2. 注册完成后自动跳转登录页
3. 使用注册的账号密码登录系统

## 页面说明

| 页面 | 文件 | 说明 |
|------|------|------|
| 登录页 | `login.html` | 用户登录入口 |
| 注册页 | `reg.html` | 管理员账号注册 |
| 首页 | `home_page.jsp` | 系统主页面 |
| 仓库列表 | `goods_list.jsp` | 货物管理页面 |
| 添加货物 | `add_goods.jsp` | 新增货物 |
| 修改货物 | `modify.jsp` | 编辑货物信息 |
| 客户管理 | `client.jsp` | 客户信息管理 |
| 个人信息 | `personal_information.jsp` | 管理员信息 |

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

## 项目特色

- ✅ **分层架构**：Controller / Service / DAO 三层分离
- ✅ **线程安全**：数据库连接等资源正确管理
- ✅ **配置分离**：数据库配置外部化，易于部署
- ✅ **前后端分离**：AJAX + JSON 实现无刷新交互
- ✅ **表单验证**：前端 JS 实时校验 + 后端验证双重保障

## License

MIT License © 2024
