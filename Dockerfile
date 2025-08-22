# Sử dụng Tomcat 9 làm base image
FROM tomcat:9.0-jdk17

# Copy file WAR (sau khi build bằng Maven) vào thư mục webapps của Tomcat
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
