# STAGE 1
FROM alpine:latest AS stage_one

WORKDIR /app

RUN mkdir docs 
RUN touch docs/doc_from_stage_one.txt

RUN mkdir docs/modules 
RUN touch docs/modules/modules_example_from_stage_one.txt

RUN mkdir storage
RUN touch storage/storage_example_from_stage.txt 

# STAGE 2
FROM alpine:latest

WORKDIR /app
COPY --from=stage_one /app/docs ./docs
COPY --from=stage_one /app/storage ./storage

COPY . . 