FROM 435649222926.dkr.ecr.ap-southeast-1.amazonaws.com/logstash:latest
COPY config/vestige-es.conf /usr/share/logstash/pipeline/vestige-es.conf
RUN apk -Uuv add groff less python py-pip
RUN pip install awscli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*

EXPOSE 9600 5044
CMD cd /usr/share/logstash; bin/logstash -w 8  -f /usr/share/logstash/pipeline/vestige-es.conf
