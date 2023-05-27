FROM openjdk:11

WORKDIR /java
ARG target_image
COPY  build/classes/java/main/${target_image}.class .
CMD [ "java", ${target_image} ]