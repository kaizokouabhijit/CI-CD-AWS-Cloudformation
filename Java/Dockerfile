FROM openjdk:11

WORKDIR /java
ARG target_image
COPY  Java/src/main/java/App.java .
RUN echo "building test Image"
CMD [ "java", App ]
