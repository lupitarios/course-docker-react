FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#/app/build the forlder we need for the second section.
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html