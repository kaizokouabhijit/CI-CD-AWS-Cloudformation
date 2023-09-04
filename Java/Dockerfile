FROM openjdk:11

WORKDIR /java
ARG target_image
COPY  build/classes/java/main/App.class .
RUN echo "building test Image"
CMD [ "java", App ]
