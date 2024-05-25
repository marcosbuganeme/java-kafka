# Etapa 1: Construção
FROM gradle:8.7-jdk21-jammy as builder

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de build (build.gradle, settings.gradle, etc.)
COPY build.gradle settings.gradle ./

# Faz o download das dependências
RUN gradle build --no-daemon || return 0

# Copia o código fonte restante
COPY . .

# Compila o projeto e cria o arquivo JAR
RUN gradle build --no-daemon

# Etapa 2: Execução
FROM openjdk:21-jdk-slim

# Define o diretório de trabalho
WORKDIR /app

# Copia o JAR da etapa de construção
COPY --from=builder /app/build/libs/*.jar app.jar

# Expõe a porta que a aplicação Spring Boot usa
EXPOSE 8081

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
