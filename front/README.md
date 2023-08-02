# Django front

## Intent of the project
Provision and deploy django webapp on GCP machines using infrastructure as code (IAC): 
- Terraform
- Cloud Run (Yes serverless 🌍)

Use devops approach with github actions because it's free and open source 🙏🏻.

And also build a new website for me, two targets one shot.

## Google Cloud Platform (GCP)
1. Create a GCP project with billing enabled

   ```shell
   PROJECT_ID=byebyemoney-1236393
   gcloud config set project $PROJECT_ID
   ```
   
2. Configure default credentials (allows Terraform to apply changes):

   ```shell
   gcloud auth application-default login
   ```

3. Enable base services:

   ```shell
   gcloud services enable \
     cloudbuild.googleapis.com \
     run.googleapis.com \
     cloudresourcemanager.googleapis.com
   ```

4. Build image using gcloud cli

   ```shell
   gcloud builds submit
   ```

## Local
### Set Up

1. Create a virtual environment:

    ```shell
    $ python<latest_version> -m venv .venv
    ```

    > **_NOTE:_** In this case i'll use python 3.10

2. Activate the virtual environment

    ```shell
    $ source .venv/bin/activate
    ```
    To check that your virtual environment has been activated:

    ```shell
    $ which pip
    working_directory/.venv/bin/pip
    ```

3. Install required libraries/dependencies:

    ```shell
    pip install -r requirements.txt
    ```
  
    You might have to upgrade your pip version:

    ```shell
    pip install --upgrade pip
    ```
4. Create Django application:

    ```shell
    django-admin startproject personnal_website
    ```
  
### Development

1. Install PostgreSQL with the official documentation: https://www.postgresql.org/download/linux/ubuntu/


2. Log in to PostgreSQL

    ```shell
    sudo -i -u postgres psql
    ```
   
3. Create dev User

    ```shell
    create user dev;create database local_db;alter role dev with password 'davethedev';grant all privileges on database local_db to dev;alter database local_db owner to dev;
    ```
    > **_NOTE:_** The db name, user, password & authorizations has to corresponds with settings.py

4. Make migrations

    ```shell
    python manage.py makemigrations
    ```

5. Migrate with `local` database profile

    ```shell
    python manage.py migrate --database=local
    ```
6. Create a superuser (admin)

    ```shell
    python manage.py createsuperuser --email <mail>@gmail.com --username <username>
    ```
7. Run application

    ```shell
    python manage.py runserver
    ```
Let's dev Dave 

![alt](https://slackmojis.com/emojis/7421-typingcat/download)