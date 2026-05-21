# 仓库管理系统 - Docker 部署

## 快速启动

```bash
# 1. 进入项目目录
cd warehouse-management-system

# 2. 一键启动（首次自动构建镜像）
docker-compose up -d --build

# 3. 等待启动完成，访问
# http://localhost:8080/
```

## 初始化账号

| 用户名 | 密码 |
|--------|------|
| test   | 123456 |
| admin  | 123456 |

## 常用操作

```bash
# 查看运行状态
docker-compose ps

# 查看日志
docker-compose logs -f web
docker-compose logs -f mysql

# 停止
docker-compose down

# 重新构建（代码更新后）
docker-compose up -d --build

# 完全重置（清除数据库）
docker-compose down -v
docker-compose up -d --build
```

## 目录结构

```
warehouse-management-system/
├── docker/
│   ├── jdbc.properties    ← Docker 环境专用配置（host=mysql）
│   └── sql/
│       └── init.sql      ← 数据库初始化脚本
├── web/                  ← Tomcat Web 应用（ROOT）
├── Dockerfile
└── docker-compose.yml
```

## 数据持久化

MySQL 数据存储在 Docker volume 中，删除容器不会丢失数据。

如需完全重置：
```bash
docker-compose down -v
```

## 注意事项

- 原 `src/com/potato/util/jdbc.properties` 使用 `localhost`，仅限宿主机 MySQL
- Docker 环境使用 `docker/jdbc.properties`，host 指向 `mysql` 容器
- 两个配置不可混用