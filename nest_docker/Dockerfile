# base image  
FROM python:3.12.3   
# setup environment variable  

ENV DockerHOME=/mydocker

# set work directory  
RUN mkdir -p $DockerHOME  

# where your code lives  
WORKDIR $DockerHOME  

RUN apt-get update
RUN apt-get install -y git

#install vim for debugging purposes only 
RUN apt-get install -y vim

RUN mkdir -p $DockerHOME/NEST_interactive
RUN git clone https://github.com/schwartzlab-methods/NEST-interactive.git $DockerHOME/NEST_interactive 

#remove the default data that come with NEST-interactive (we are going to add a different set)
RUN rm -f $DockerHOME/NEST_interactive/server/data/files/*.csv
RUN rm -f $DockerHOME/NEST_interactive/server/data/files/*.gz

# set environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

# install dependencies  
RUN pip install --upgrade pip  

# we have checked out the NEST interaction github repo into the docker image but we need to 
# add:
# a slightly modified nest_intractive launch script.  It just needs to specify 0.0.0.0:8000 when
# we are launching the server
COPY ./nest_interactive $DockerHOME/NEST_interactive

# the requirements file with the set of python packages and version that need to be installed
COPY ./requirements.txt $DockerHOME  

#our data file to replace the default version that comes with NEST
COPY ./lymphnode_files/* $DockerHOME/NEST_interactive/server/data/files

# run this command to install all dependencies  
RUN pip install -r requirements.txt  

# port where the Django app runs  
EXPOSE 8000  
EXPOSE 8080

WORKDIR $DockerHOME/NEST_interactive

# start server - script in the nest interactive directory that starts Django and starts the front end 
CMD bash nest_interactive 8080 server/data/files/









