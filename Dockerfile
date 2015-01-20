FROM debian
MAINTAINER Mark Redar mredar@gmail.com

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y -q python && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 25

ADD smtpd-run.py /smtpd-run.py

# smtpd-run.py uses smtpd std lib server running in asyncore
CMD python /smtpd-run.py
