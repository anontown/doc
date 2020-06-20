FROM node:10.15.3 as builder

ENV WORKDIR=/workdir
WORKDIR $WORKDIR

COPY package.json package-lock.json $WORKDIR/
RUN npm ci --no-progress
RUN npx gitbook install

COPY src $WORKDIR/src
RUN npm run build

FROM nginx:1.17.4

COPY nginx.conf /etc/nginx
COPY --from=builder /workdir/dist /usr/share/nginx/html
