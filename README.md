
# Real-Time Transaction Monitor

## Description
The Real-Time Transaction Monitor is a system designed to monitor financial transactions in real-time. It uses Apache Kafka for real-time data ingestion, PostgreSQL for transaction storage, and Java (with Spring Boot) for data processing and analysis.

## Features
- Fraud detection
- Real-time alerts
- Monitoring dashboard

## Tools and Technologies
- **Java**: For backend development and data processing.
- **Apache Kafka**: For real-time data ingestion and processing.
- **PostgreSQL**: For data storage and querying.
- **Spring Boot**: For rapid application development.
- **Kafka Streams or Kafka Connect**: To facilitate data processing and integration.
- **Angular**: For developing interactive frontends.

## System Components
1. **Producer**: A service to simulate the generation of financial transactions and send them to an Apache Kafka topic.
2. **Consumer**: A service to consume transaction data from the Kafka topic and process it (including fraud detection).
3. **Database**: A PostgreSQL database to store the processed transactions.
4. **API Backend**: An API developed in Java with Spring Boot to manage and expose processed data.
5. **Frontend**: An Angular application to visualize and monitor transactions in real-time.

## Project Steps
1. **Environment Setup**:
   - Install and configure Apache Kafka.
   - Configure PostgreSQL.

2. **Producer Development**:
   - Create a Java (Spring Boot) service that simulates the generation of financial transactions and sends data to a Kafka topic.

3. **Consumer Development**:
   - Create a Java (Spring Boot) service that consumes data from Kafka, processes transactions, and detects possible fraud.
   - Store transactions in PostgreSQL.

4. **API Backend Development**:
   - Create RESTful endpoints in Java (Spring Boot) to expose transaction data stored in PostgreSQL.

5. **Frontend Development**:
   - Create an Angular application to visualize transactions in real-time, including dashboards and alerts.

6. **Integration and Testing**:
   - Integrate all system components and perform tests to ensure correct operation and accurate fraud detection.

## Spring Initializr Dependencies
Select the following dependencies in the Spring Initializr for the project:

1. **Spring Boot DevTools**: For facilitating development with automatic restarts.
2. **Spring Web**: To create the REST API.
3. **Spring Data JPA**: To interact with the PostgreSQL database.
4. **PostgreSQL Driver**: For connecting to PostgreSQL.
5. **Spring for Apache Kafka**: To work with Apache Kafka.
6. **Spring Boot Actuator**: For application monitoring and metrics (optional).
7. **Spring Security**: If API security is needed (optional).

## Design Clean Architecture

src
├── main
│   ├── java
│   │   └── br
│   │       └── com
│   │           └── devdojo
│   │               ├── application
│   │               │   ├── service
│   │               │   │   └── TransactionService.java
│   │               │   └── usecase
│   │               │       └── MonitorTransactions.java
│   │               ├── config
│   │               │   └── KafkaConfig.java
│   │               ├── domain
│   │               │   ├── model
│   │               │   │   └── Transaction.java
│   │               │   ├── repository
│   │               │   │   └── TransactionRepository.java
│   │               │   └── service
│   │               │       └── FraudDetectionService.java
│   │               ├── infrastructure
│   │               │   ├── consumer
│   │               │   │   └── TransactionConsumer.java
│   │               │   ├── producer
│   │               │   │   └── TransactionProducer.java
│   │               │   └── repository
│   │               │       └── JpaTransactionRepository.java
│   │               └── web
│   │                   ├── controller
│   │                   │   └── TransactionController.java
│   │                   └── dto
│   │                       └── TransactionDto.java
│   └── resources
│       └── application.properties
└── test
    └── java
        └── br
            └── com
                └── devdojo
                    └── transactional
                        ├── TransactionServiceTest.java
                        ├── FraudDetectionServiceTest.java
                        └── TransactionControllerTest.java



## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/marcosbuganeme/java-kafka.git
   ```
2. Navigate to the project directory:
   ```bash
   cd java-kafka
   ```
3. Build the project:
   ```bash
   ./mvnw clean install
   ```
4. Run the application:
   ```bash
   ./mvnw spring-boot:run
   ```

## Configuration
Update the `application.properties` file with your PostgreSQL and Kafka configurations:

```properties
# Kafka Properties
spring.kafka.bootstrap-servers=localhost:9092
spring.kafka.consumer.group-id=real-time-transaction-monitor-group
spring.kafka.consumer.auto-offset-reset=earliest

# JPA Properties
spring.datasource.url=jdbc:postgresql://localhost:5432/monitor_transactions_db
spring.datasource.username=user
spring.datasource.password=123456
spring.jpa.hibernate.ddl-auto=update
```

## License
This project is licensed under the MIT License.
