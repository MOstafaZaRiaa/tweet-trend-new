FROM openjdk:17
ADD jarstaging/com/valaxy/demo-workshop/2.1.2/demo-workshop-2.1.2.jar namtrend.jar
ENTRYPOINT [ "java", "-jar", "namtrend.jar" ]
