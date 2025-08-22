# Dùng Tomcat 9 với JDK 11 (ổn định, hợp với Servlet API 4.0)
FROM tomcat:9.0-jdk11

# Xóa các app mặc định của Tomcat (ROOT, docs, examples)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR đã build từ Maven vào Tomcat
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
