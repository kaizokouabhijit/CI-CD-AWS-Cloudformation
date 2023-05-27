FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip


COPY . /AWS
WORKDIR /AWS


# to run the main.py file

CMD [ "python3", "/AWS/main.py" ]



