FROM lsiobase/alpine.python

EXPOSE  6767
VOLUME /tv /bazarr/data

# Update
RUN apk add --update build-base python-dev py2-pip py-setuptools jpeg-dev zlib-dev git

# Get application source from Github
RUN git clone -b master --single-branch https://github.com/morpheus65535/bazarr.git /bazarr

# Install app dependencies
RUN pip install -r /bazarr/requirements.txt

WORKDIR /bazarr
CMD ["python", "bazarr.py"]