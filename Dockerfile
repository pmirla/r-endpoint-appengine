FROM gcr.io/gcer-public/plumber-appengine
LABEL maintainer="pavanmirla"
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
  && apt-get install -y libcurl4-openssl-dev \
	libssl-dev \
	make
RUN ["install2.r", "assertthat","plumber", "crayon", "curl", "digest", "googleAuthR", "googleCloudStorageR", "hms", "httr", "jsonlite", "memoise", "openssl", "pillar", "pkgconfig", "R6", "Rcpp", "readr", "rlang", "tibble", "yaml", "zip"]
WORKDIR /payload/
COPY ["./", "./"]
CMD ["R"]

EXPOSE 8080
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=8080)"]
CMD ["schedule.R"]

