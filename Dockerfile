FROM hashicorp/terraform:0.11.13

ENTRYPOINT [ "/bin/sh" ]

RUN mkdir /app
WORKDIR /app

COPY . . 