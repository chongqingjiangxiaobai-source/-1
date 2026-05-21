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

## 快速开始

### 1. 环境要求
- JDK 8+
- MySQL 5.7+
- Tomcat 9+

### 2. 数据库配置

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

### 3. 修改数据库连接

编辑 `src/com/potato/util/jdbc.properties`：
```properties
username=root
pwd=你的密码
url=jdbc:mysql://localhost:3306/warehouse?serverTimezone=Asia/Shanghai
driverName=com.mysql.cj.jdbc.Driver
```

### 4. 部署运行

1. 将项目导入 IDE（IntelliJ IDEA / Eclipse）
2. 配置 Tomcat 服务器
3. 访问 `http://localhost:3000/warehouse/`

## 🔗 在线演示

| 环境 | 地址 |
|------|------|
| 主站（端口3000） | http://123.207.205.179:3000/warehouse/ |
| 备用站（端口3001） | http://123.207.205.179:3001/warehouse2/ |

### 测试账号
- 用户名：`test`
- 密码：`123456`

## 页面预览

| 登录页 | 注册页 |
|:---:|:---:|
| ![login](https://img.shields.io/badge/login-required-blue) | ![register](https://img.shields.io/badge/register-available-green) |

| 首页 | 仓库列表 |
|:---:|:---:|
| `home_page.jsp` | `goods_list.jsp` |

## 问题修复记录

- ✅ DBUtils 硬编码路径 → ClassLoader 加载配置文件
- ✅ DAO 层线程安全 → conn/ps/rs 改为局部变量
- ✅ SQL 硬编码数据库前缀 → 移除 `warehouse.` 前缀
- ✅ LoginServlet 重复查询 → 优化为单次查询
- ✅ GoodsDaoImpl 列名大小写 → `Site` → `site`
- ✅ 表单验证增强 → 确认密码校验 + 提交拦截

## License

MIT License © 2024
