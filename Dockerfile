FROM node:14.16.1-buster
WORKDIR /usr/src/app
COPY . .

ARG SHA
ENV SHA=$SHA
ENV NODE_ENV=production
RUN echo "NEXT_PUBLIC_SHA=${SHA}" > .env.local

RUN npm install --update-checksums --prod
RUN npm run build

CMD npm start