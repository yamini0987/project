FROM maven:3-adoptopenjdk-8 as mvn_build
WORKDIR /app
COPY . .
RUN mvn clean package


FROM tomcat:8
COPY --from=mvn_build /app/target/*.war /usr/local/tomcat/webapps
