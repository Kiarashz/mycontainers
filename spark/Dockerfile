ARG  SPARK_BINARY_URL=https://dlcdn.apache.org/spark/spark-3.2.2
ARG  SPARK_BINARY_FILE=spark-3.2.2-bin-hadoop2.7
ARG  SPARK_BINARY_TYPE=tgz

FROM alpine:latest AS builder0
RUN apk update \
    && apk upgrade \
    && apk add build-base \
    && apk add --no-cache \
    ca-certificates \
    curl \
    wget \
    tar \
    bash \
    zip \
    unzip \
    linux-headers \
    python3 \
    python3-dev \
    py3-pip \
    git \
    vim \
    tree \
    sudo \
    tini linux-pam nss \
    openjdk8 \
    && rm -rf /var/cache/apk/*


FROM builder0 AS builder1
ARG  SPARK_BINARY_URL
ARG  SPARK_BINARY_FILE
ARG  SPARK_BINARY_TYPE
ENV SPARK_HOME /opt/${SPARK_BINARY_FILE}
WORKDIR /opt
RUN wget ${SPARK_BINARY_URL}/${SPARK_BINARY_FILE}.${SPARK_BINARY_TYPE}
RUN ls
RUN tar -xvf ${SPARK_BINARY_FILE}.${SPARK_BINARY_TYPE}
RUN rm -rf ${SPARK_BINARY_FILE}.${SPARK_BINARY_TYPE}
RUN mkdir -p /opt/spark/work-dir
RUN pwd
RUN ls
COPY conf/spark-env.sh $SPARK_HOME/conf/
COPY conf/spark-defaults.conf $SPARK_HOME/conf/
COPY src/shared /opt/spark/work-dir/shared
COPY entrypoint.sh /opt/
RUN tree
RUN chmod +x /opt/entrypoint.sh
WORKDIR /opt/spark/work-dir
RUN zip -r shared.zip shared
RUN rm -rf shared


FROM builder0
ARG  SPARK_BINARY_URL
ARG  SPARK_BINARY_FILE
ARG  SPARK_BINARY_TYPE
COPY --from=builder1 /opt /opt/
RUN pwd
RUN ls
RUN ls /opt/
RUN mv /opt/entrypoint.sh /usr/local/ && \
    pip3 install --upgrade pip && pip3 install --upgrade cython \
    boto boto3 botocore requests s3transfer sparkaid s3utils awscliv2 wheel
ENV SPARK_HOME /opt/${SPARK_BINARY_FILE}
ENV PATH $PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
ENV PYSPARK_PYTHON /usr/bin/python3
ENV AWS_REGION ap-southeast-2
ENV AWS_DEFAULT_REGION ap-southeast-2
ENV	LOG4J_FORMAT_MSG_NO_LOOKUPS=true

WORKDIR /opt/spark/work-dir
ENTRYPOINT [ "/user/local/entrypoint.sh" ]