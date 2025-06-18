FROM --platform=linux/amd64 python:3.12.9-bullseye

WORKDIR /usr/local/app
ENV PYTHONUNBUFFERED 1
ENV MYSQL_ROOT_PASSWORD=Otterfices
ENV MYSQL_DATABASE=mariadb
ENV MYSQL_USER=hcar
ENV MYSQL_PASSWORD=1337

#ENV WORKON_HOME /usr/local/app/.virtualenvs
#ENV VIRTUALENVWRAPPER_PYTHON /usr/bin/python3
#ENV VIRTUALENVWRAPPER_VIRTUALENV_ARGS ' -p /usr/bin/python3 '
#ENV PROJECT_HOME /usr/local/app/Devel


# Copy in the source code
COPY src ./src
EXPOSE 5000
EXPOSE 8000

# Install the application dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# install mySQL server
RUN apt update
RUN apt install mariadb-server -y

ENTRYPOINT ./src/setup.sh ; /bin/bash

# Setup an app user so the container doesn't run as the root user
#RUN useradd app
#USER app



#CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
