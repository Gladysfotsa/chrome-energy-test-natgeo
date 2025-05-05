FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget curl gnupg2 software-properties-common \
    libasound2 libgbm-dev libnss3 libxss1 libgtk-3-0 \
    x11-utils xvfb bash ca-certificates

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'

RUN apt-get update && apt-get install -y google-chrome-stable

COPY chrome-entry.sh /usr/local/bin/chrome-entry.sh
RUN chmod +x /usr/local/bin/chrome-entry.sh

CMD ["/usr/local/bin/chrome-entry.sh"]
