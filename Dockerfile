FROM flurdy/oracle-java7

RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y git maven

COPY / /usr/src/
WORKDIR /usr/src

RUN mvn clean install
#CMD ["mvn", "clean", "install"]
CMD ["mvn", "exec:java", "-Dexec.classpathScope=test", "-Dexec.mainClass=org.springframework.amqp.rabbit.stocks.Server"]
