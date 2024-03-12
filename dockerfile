FROM node AS hari
RUN mkdir /app
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx
COPY --from=hari /app/dist/hari-app/browser/ /usr/share/nginx/html/
EXPOSE 80

