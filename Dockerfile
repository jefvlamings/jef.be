# Static site served by the official nginx image's Alpine "slim" variant.
FROM nginx:1.29-alpine-slim@sha256:c9366b8c560169b101ca0e5422ed063b20779e6454c2326b9c9704225c9b0c08

COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
# Drop the base image's sample pages before adding the site.
RUN rm /usr/share/nginx/html/*
COPY --chown=root:root --chmod=u=rwX,go=rX public/ /usr/share/nginx/html/
