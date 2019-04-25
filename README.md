# The docker runtime for Facenet tensorflow implementation

This is a simple runtime aimed at conviniently configuring remote `python` interpreter using `PyCharm` for performing tasks related to [the origin work](https://github.com/davidsandberg/facenet). 

## Pre-built docker image
A pre-built image is available. You can pull the image by:
```bash
docker pull sean962081468/facenet:runtime
```

## Build image locally
You can build the image by:
```bash
docker build -t facenet:runtime .
```

## Configure remote 
Check more at [how to configure docker remote interpreter using pycharm](https://www.jetbrains.com/help/pycharm/using-docker-as-a-remote-interpreter.html).
