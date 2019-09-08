FROM tiangolo/uwsgi-nginx-flask:python3.6-alpine3.7
ENV STATIC_URL /static
ENV STATIC_PATH /var/www/app/static

COPY ./requirements.txt /var/www/requirements.txt
COPY ./app /app

RUN apk --nocache --update add bash nano \
  && pip install -r /var/www/requirements.txt \
  && addgroup -S flaskapp \
  && adduser -S flaskapp -G flaskapp \
  && chown -R flaskapp:flaskapp /app

USER flaskapp