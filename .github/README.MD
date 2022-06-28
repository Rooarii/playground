# Continuous Integration

I'm using github actions workflows for continuous integration.

## Create new pipeline

Create a `<PIPELINE_NAME>.yaml` in `.github/workflows`
It will automatically be launched depending on what github action event types,
defined in `<PIPELINE_NAME>.yaml`

## Validate pipeline locally

In order to avoid loss of time to validate pipeline:
- commit
- push
- test pipeline directlyin github

you can validate your pipeline using [act](https://github.com/nektos/act)

### installation

```shell
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

### Test pipeline
```shell
act -n
```
**Output**
```shell
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] 🚀  Start image=ghcr.io/catthehacker/ubuntu:full-20.04
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ] 🚀  Start image=ghcr.io/catthehacker/ubuntu:full-20.04
*DRYRUN* [Continuous integration (CI)/build-django-application ] 🚀  Start image=ghcr.io/catthehacker/ubuntu:full-20.04
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   🐳  docker pull image=ghcr.io/catthehacker/ubuntu:full-20.04 platform= username= forcePull=false
*DRYRUN* [Continuous integration (CI)/build-django-application ]   🐳  docker pull image=ghcr.io/catthehacker/ubuntu:full-20.04 platform= username= forcePull=false
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ]   🐳  docker pull image=ghcr.io/catthehacker/ubuntu:full-20.04 platform= username= forcePull=false
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   🐳  docker create image=ghcr.io/catthehacker/ubuntu:full-20.04 platform= entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   🐳  docker run image=ghcr.io/catthehacker/ubuntu:full-20.04 platform= entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
*DRYRUN* [Continuous integration (CI)/build-django-application ]   🐳  docker create image=ghcr.io/catthehacker/ubuntu:full-20.04 platform= entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
*DRYRUN* [Continuous integration (CI)/build-django-application ]   🐳  docker run image=ghcr.io/catthehacker/ubuntu:full-20.04 platform= entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ]   🐳  docker create image=ghcr.io/catthehacker/ubuntu:full-20.04 platform= entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ]   🐳  docker run image=ghcr.io/catthehacker/ubuntu:full-20.04 platform= entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ☁  git clone 'https://github.com/actions/setup-python' # ref=v3
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ☁  git clone 'https://github.com/actions/setup-python' # ref=v3
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ] ⭐ Run Main actions/checkout@v3
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ]   ✅  Success - Main actions/checkout@v3
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ] ⭐ Run Main Initialize terraform
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ]   ✅  Success - Main Initialize terraform
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ] ⭐ Run Main Format all terraform files
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ]   ✅  Success - Main Format all terraform files
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ] ⭐ Run Main Validate terraform configuration
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ]   ✅  Success - Main Validate terraform configuration
*DRYRUN* [Continuous integration (CI)/check-infrastructure     ] 🏁  Job succeeded
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] ⭐ Run Main actions/checkout@v3
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ✅  Success - Main actions/checkout@v3
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] ⭐ Run Main actions/setup-python@v3
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ✅  Success - Main actions/setup-python@v3
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] ⭐ Run Main Create python virtual environment
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ✅  Success - Main Create python virtual environment
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] ⭐ Run Main Source python virtual environment
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ✅  Success - Main Source python virtual environment
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] ⭐ Run Main Install required dependencies
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ✅  Success - Main Install required dependencies
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] ⭐ Run Main Upgrade pip version
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ✅  Success - Main Upgrade pip version
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] ⭐ Run Main Migrate Database
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ✅  Success - Main Migrate Database
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] ⭐ Run Main Check django_app
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ✅  Success - Main Check django_app
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] ⭐ Run Main Test django_app
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ✅  Success - Main Test django_app
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] ⭐ Run Post actions/setup-python@v3
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp]   ✅  Success - Post actions/setup-python@v3
*DRYRUN* [Continuous integration (CI)/build-front-django-webapp] 🏁  Job succeeded
*DRYRUN* [Continuous integration (CI)/build-django-application ] ⭐ Run Main actions/checkout@v3
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ✅  Success - Main actions/checkout@v3
*DRYRUN* [Continuous integration (CI)/build-django-application ] ⭐ Run Main actions/setup-python@v3
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ✅  Success - Main actions/setup-python@v3
*DRYRUN* [Continuous integration (CI)/build-django-application ] ⭐ Run Main Create python virtual environment
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ✅  Success - Main Create python virtual environment
*DRYRUN* [Continuous integration (CI)/build-django-application ] ⭐ Run Main Source python virtual environment
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ✅  Success - Main Source python virtual environment
*DRYRUN* [Continuous integration (CI)/build-django-application ] ⭐ Run Main Install required dependencies
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ✅  Success - Main Install required dependencies
*DRYRUN* [Continuous integration (CI)/build-django-application ] ⭐ Run Main Upgrade pip version
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ✅  Success - Main Upgrade pip version
*DRYRUN* [Continuous integration (CI)/build-django-application ] ⭐ Run Main Migrate Database
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ✅  Success - Main Migrate Database
*DRYRUN* [Continuous integration (CI)/build-django-application ] ⭐ Run Main Check django_app
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ✅  Success - Main Check django_app
*DRYRUN* [Continuous integration (CI)/build-django-application ] ⭐ Run Main Test django_app
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ✅  Success - Main Test django_app
*DRYRUN* [Continuous integration (CI)/build-django-application ] ⭐ Run Post actions/setup-python@v3
*DRYRUN* [Continuous integration (CI)/build-django-application ]   ✅  Success - Post actions/setup-python@v3
*DRYRUN* [Continuous integration (CI)/build-django-application ] 🏁  Job succeeded
```
### Act docs https://github.com/nektos/act