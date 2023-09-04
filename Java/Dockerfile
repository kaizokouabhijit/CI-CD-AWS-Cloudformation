FROM openjdk:11

WORKDIR /java
ARG target_image
COPY  build/classes/java/main/App.class .
CMD [ "java", App ]
