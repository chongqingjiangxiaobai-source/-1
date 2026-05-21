#!/bin/bash
# =====================================================
# build-docker.sh - 构建 Docker 镜像
# =====================================================

set -e

cd "$(dirname "$0")"

echo ">>> 构建 Docker 镜像..."
docker-compose build --no-cache web

echo ""
echo ">>> 启动容器..."
docker-compose up -d

echo ""
echo ">>> 等待 MySQL 就绪..."
sleep 15

echo ""
echo ">>> 检查容器状态..."
docker-compose ps

echo ""
echo ">>> 完成！访问 http://localhost:8080/"
echo "    默认账号: test / 123456"