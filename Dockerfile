FROM node:14.20-alpine
# Install necessary packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash git

# Install Angular CLI globally
RUN npm install -g @angular/cli
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN ng build --prod
ENTRYPOINT ["ng","serve","--host","0.0.0.0","--port","4200"]
