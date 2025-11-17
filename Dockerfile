FROM node:18-slim

RUN mkdir -p /home/node/CV
WORKDIR /home/node/CV

# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
RUN apt-get update
RUN apt-get install -y wget gnupg
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
RUN apt-get install -y google-chrome-unstable
RUN apt-get install -y fonts-ipafont-gothic --no-install-recommends
RUN apt-get install -y fonts-wqy-zenhei --no-install-recommends
RUN apt-get install -y fonts-thai-tlwg --no-install-recommends
RUN apt-get install -y fonts-kacst --no-install-recommends
RUN apt-get install -y fonts-freefont-ttf --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y gconf-service
RUN apt-get install -y libasound2
RUN apt-get install -y libatk1.0-0
RUN apt-get install -y libc6
RUN apt-get install -y libcairo2
RUN apt-get install -y libcups2
RUN apt-get install -y libdbus-1-3
RUN apt-get install -y libexpat1
RUN apt-get install -y libfontconfig1
RUN apt-get install -y libgconf-2-4
RUN apt-get install -y libgdk-pixbuf2.0-0
RUN apt-get install -y libglib2.0-0
RUN apt-get install -y libgtk-3-0
RUN apt-get install -y libnspr4
RUN apt-get install -y libpango-1.0-0
RUN apt-get install -y libpangocairo-1.0-0
RUN apt-get install -y libstdc++6
RUN apt-get install -y libx11-6
RUN apt-get install -y libx11-xcb1
RUN apt-get install -y libxcb1
RUN apt-get install -y libxcomposite1
RUN apt-get install -y libxcursor1
RUN apt-get install -y libxdamage1
RUN apt-get install -y libxext6
RUN apt-get install -y libxfixes3
RUN apt-get install -y libxi6
RUN apt-get install -y libxrandr2
RUN apt-get install -y libxrender1
RUN apt-get install -y libxss1
RUN apt-get install -y libxtst6
RUN apt-get install -y ca-certificates
RUN apt-get install -y fonts-liberation
RUN apt-get install -y libnss3
RUN apt-get install -y lsb-release
RUN apt-get install -y xdg-utils
RUN apt-get install -y wget
RUN apt-get install -y wget
RUN apt-get install -y wkhtmltopdf

CMD chmod +x install.sh && chmod +x generate.sh && npm install && ./install.sh && ./generate.sh