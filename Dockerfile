FROM node:latest

WORKDIR /usr/src/app

COPY package.json ./
COPY package-lock.json ./

RUN npm install

# Copying extracted folder /tmp/phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2-extract-1521107727318/phantomjs-2.1.1-linux-x86_64 -> /usr/src/app/node_modules/phantomjs-prebuilt/lib/phantom
# Writing location.js file
# Done. Phantomjs binary available at /usr/src/app/node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs
RUN ln -s /usr/src/app/node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs /usr/local/bin/phantomjs

COPY . .

ENV LINE_CHANNEL_ACCESS_TOKEN 123456
ENV LINE_CHANNEL_SECRET 123456
ENV IMGUR_CLIENT_ID 123456
ENV PORT 3000
ENV CRYPTO_PAGE_2_RICH_MENU_ID 1

EXPOSE 3000

CMD [ "npm", "start" ]