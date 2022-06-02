ARG VARIANT="21.3.0-xe"

FROM katsutoshiotogawa/oracle:${VARIANT}-apex-dev
USER root
# software update
RUN yum update -y

USER oracle

COPY ORCL_software/apex_*.zip .

RUN unzip apex_*.zip > /dev/null
RUN rm apex_*.zip

WORKDIR /home/oracle/apex

RUN sqlplus / as sysdba @apxdevrm

WORKDIR /home/oracle

RUN rm -rf apex/
