# Stage 1: Build WAR bằng Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Deploy WAR vào Tomcat
FROM tomcat:10.1-jdk17
# Xóa app mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy file WAR vừa build vào Tomcat, đổi tên thành ROOT.war để chạy trực tiếp ở "/"
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
