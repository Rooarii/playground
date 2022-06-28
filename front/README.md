# Django front

## Intent of the project
Provision and deploy django webapp on GCP machines using infrastructure as code (IAC): 
- Terraform
- Cloud Run (Yes serverless 🌍)

Use devops approach with github actions because it's free and open source 🙏🏻.

And also build a new website for me, two targets one shot.

## Set Up

- Create a virtual environment:

    ```shell
    $ python<latest_version> -m venv .venv
    ```

    > **_NOTE:_** In this case i'll use python 3.10

- Activate the virtual environment

    ```shell
    $ source .venv/bin/activate
    ```

  To check that your virtual environment has been activated:

    ```shell
    $ which pip
    working_directory/.venv/bin/pip
    ```

- Install required libraries/dependencies:

    ```shell
     pip install -r requirements.txt
    ```
  
  You might have to upgrade your pip version:

  ```shell
      pip install --upgrade pip
  ```
- Create Django application:

  ```shell
    django-admin startproject personnal_website
  ```