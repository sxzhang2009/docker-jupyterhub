# An incomplete base Docker image for running JupyterHub
#
# Add your configuration to create a complete derivative Docker image.
#
# Include your configuration settings by starting with one of two options:
#
# Option 1:
#
# FROM jupyterhub/jupyterhub:latest
#
# And put your configuration file jupyterhub_config.py in /srv/jupyterhub/jupyterhub_config.py.
#
# Option 2:
#
# Or you can create your jupyterhub config and database on the host machine, and mount it with:
#
# docker run -v $PWD:/srv/jupyterhub -t jupyterhub/jupyterhub
#
# NOTE
# If you base on jupyterhub/jupyterhub-onbuild
# your jupyterhub_config.py will be added automatically
# from your docker directory.

FROM jupyterhub-server-basic:1.0
LABEL maintainer="Shixun Zhang <shixun.zhang@outlook.com>"

# install nodejs, utf8 locale, set CDN because default httpredir is unreliable
ENV DEBIAN_FRONTEND noninteractive

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
    matplotlib netcdf4 jupyterhub oauthenticator \
    notebook jupyterhub-simplespawner \
    jupyterhub-systemdspawner \
    dockerspawner

RUN mkdir -p /srv/jupyterhub/
WORKDIR /srv/jupyterhub/

EXPOSE 8000
EXPOSE 8001

LABEL org.jupyter.service="jupyterhub"

CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]
