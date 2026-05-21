# =====================================================
# Dockerfile - 仓库管理系统
# 基于 Tomcat 9.0 + JRE 17
# =====================================================

FROM tomcat:9.0-jre17

# 删除默认 ROOT 应用
RUN rm -rf $CATALINA_HOME/webapps/ROOT

# 复制完整 warehouse 应用（从本地已部署目录）
COPY webapps/warehouse/ $CATALINA_HOME/webapps/ROOT/

# 复制 Docker 环境专用 JDBC 配置（host 指向宿主机 IP）
COPY docker/jdbc.properties $CATALINA_HOME/webapps/ROOT/WEB-INF/classes/jdbc.properties

EXPOSE 8080

CMD ["catalina.sh", "run"]