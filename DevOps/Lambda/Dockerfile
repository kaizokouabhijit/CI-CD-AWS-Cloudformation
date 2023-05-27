FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip


COPY . /Lambda
WORKDIR /Lambda


# to run the main.py file

CMD [ "python3", "/Lambda/main.py" ]



