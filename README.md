# The docker workspace for Facenet tensorflow implementation
This project is largely based on [the origin work](https://github.com/davidsandberg/facenet)

To get started, clone this repository:
```bash
git clone https://github.com/SeanSyue/Facenet-docker.git
cd Facenet-docker
git submodule update --init 
```

## Steps to re-produce

### Pre-built docker image
A pre-built image is available. You can pull the image by:
```bash
docker pull sean962081468/facenet
```
By doing so, you can directy run the evaluation command metioned in [here](https://github.com/davidsandberg/facenet/wiki/Validate-on-lfw#6-run-the-test) 
(**NOTE:** use `python3` instead of `python` in the `docker` container environment)

### Build image locally

1. Download the unaligned images
    ```bash
    mkdir -p datasets/lfw/raw && \
    curl http://vis-www.cs.umass.edu/lfw/lfw.tgz | tar -xz -C datasets/lfw/raw --strip-components=1
    ```

2. Download the model from [here](https://drive.google.com/open?id=1EXPBSXwTaqrSC0OhUdXNmKSh9qJUQ55-) and save the model in `models/facenet/` directory. After extracting the archive there should be a new folder 20180402-114759 with the contents:
    ```
    20180402-114759.pb
    model-20180402-114759.ckpt-275.data-00000-of-00001
    model-20180402-114759.ckpt-275.index
    model-20180402-114759.meta
    ```

3. Build the `docker` image and run the `docker` container. Make sure you have [`nvidia-docker`](https://github.com/NVIDIA/nvidia-docker) installed: 
   ```bash
   docker build --rm -t facenet:latest .
   docker run --runtime=nvidia -it -v $pwd/datasets/lfw:/root/datasets/lfw --name facenet sean962081468/facenet:latest
   ```

   This will spawn a docker container environent for you. Before continue the following steps, make sure image data and model are appear in `~/datasets/lfw/` and `~/models/facenet/` folders. If not, type `exit` inside the `docker` container and copy them from your host machine, then restart and attach the container:
   ```bash
   docker cp $pwd/datasets/lfw facenet:/root/datasets/lfw
   docker cp $pwd/models/facenet facenet:/root/models/facenet
   docker restart facenet
   docker attach facenet
   ```

4. For the following step, follow [this](https://github.com/davidsandberg/facenet/wiki/Validate-on-lfw#4-align-the-lfw-dataset) and [this](https://github.com/davidsandberg/facenet/wiki/Validate-on-lfw#6-run-the-test) from the origin repository (**NOTE:** use `python3` instead of `python` in the `docker` container environment). 