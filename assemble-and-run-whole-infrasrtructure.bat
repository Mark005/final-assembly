@ECHO ON

call .\gateway\gradlew.bat -p .\gateway ^
:gateway-headers:clean :gateway-headers:publishToMavenLocal

call .\market-service\gradlew.bat -p .\market-service ^
:market-service-model:clean :market-service-model:publishToMavenLocal
call .\market-service\gradlew.bat -p .\market-service ^
:market-service-client:clean :market-service-client:publishToMavenLocal

call .\auth-service\gradlew.bat -p .\auth-service clean build publishToMavenLocal

call .\gateway\gradlew.bat -p .\gateway clean build publishToMavenLocal

call .\delivery-service\gradlew.bat -p .\delivery-service clean build publishToMavenLocal

call .\notification-service\gradlew.bat -p .\notification-service clean build publishToMavenLocal

call .\market-service\gradlew.bat -p .\market-service clean build publishToMavenLocal

call docker-compose down
call docker-compose up --build -d