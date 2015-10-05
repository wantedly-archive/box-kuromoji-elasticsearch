FROM elasticsearch:1.5.1
MAINTAINER Daisuke Fujita <dai@wantedly.com> (@dtan4)

RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-analysis-kuromoji/2.5.0
