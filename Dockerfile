# STAGE 1
FROM alpine:latest AS stage_one

WORKDIR /app

RUN mkdir docs 
RUN touch docs/doc_from_stage_one.txt


# STAGE 2
FROM alpine:latest

WORKDIR /app
COPY --from=stage_one /app/docs /app/docs

COPY . . 

CMD ["ls docs/"]


