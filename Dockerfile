FROM atlasanalyticsservice/analytics-ingress-base:latest

LABEL maintainer Ilija Vukotic <ivukotic@cern.ch>

WORKDIR /home/analyticssvc

RUN mkdir Jobs
COPY Jobs Jobs/

CMD [ "sleep","9999999" ]