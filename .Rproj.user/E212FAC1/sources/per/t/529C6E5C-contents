FROM gcr.io/gcer-public/plumber-appengine

# install the linux libraries needed for plumber
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
&& apt-get install -y

# install plumber commented as plumber is preinstalled
#RUN R -e "install.packages(c('plumber'), repos='http://cran.rstudio.com/')"

# copy everything from the current directory into the container
WORKDIR /payload/
COPY [".", "./"]

# open port 8080 to traffic
EXPOSE 8080

# when the container starts, start the main.R script
ENTRYPOINT ["Rscript", "main.R"]

