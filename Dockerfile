# Use uma imagem base mais leve do Java 22
FROM openjdk:22-jdk-slim

# Define o diretório de trabalho
WORKDIR /app

# Copia o arquivo pom.xml e instala dependências (assumindo uso do Maven)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copia os arquivos restantes do projeto
COPY . .

# Compila o projeto e cria o arquivo JAR
RUN mvn package

# Expõe a porta que a aplicação Spring Boot usa
EXPOSE 8081

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "target/app.jar"]
