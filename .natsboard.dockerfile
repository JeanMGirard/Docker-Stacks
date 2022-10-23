FROM node:13-alpine
EXPOSE 3000
EXPOSE 3001

WORKDIR /app

# RUN npm init --yes
RUN npm install -g natsboard

ENTRYPOINT ["natsboard"]
