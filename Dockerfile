# Build Step
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# App Run Step
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

#docker build -t tjid421/test-docker-react .
#docker run tjid421/test-docker-react