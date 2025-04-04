**Finetuning Docker Environment**

This Process Improvement provides a custom Docker image built on top of  `intel/intel-extension-for-pytorch:2.6.10-xpu-pip-jupyter`. 

This image is specifically built for **fine-tuning transformer models** using Intel Extension for PyTorch on bare metal.It particularly facilitates the access to Jupyter Lab and has pre-installed libraries required for finetuning.

> You can check out for the latest tag of torch [here](https://hub.docker.com/r/intel/intel-extension-for-pytorch).

**Environment Setup:**
 
Ensure that **Docker** is installed on your system.  

Check your Docker installation with:

```bash
docker --version
```

Note: If Docker is not installed, follow the official [Docker installation guide](https://docs.docker.com/engine/install/).



1. To build the docker image:

Either grab the Image details and create a docker file in your local system or clone this repository.

```bash
git clone 
export DOCKER_IMAGE=torch-xpu-jupyter
docker build -t $DOCKER_IMAGE .
```

**ZE_AFFINITY_MASK** value is set only when we do not want to use all the devices in a system.
 
2. Run the following command to start a container from the built image:


```bash
export CONTAINER_NAME=xpu-jupter
docker run -it \
    --network=host \
    --device /dev/dri \
    --name $CONTAINER_NAME \
    -v ~/workspace/finetuning:/finetuning \
    -v ~/.cache/huggingface:/root/.cache/huggingface \
    -v /tmp/checkpoints/:/root/temp/checkpoints \
    $DOCKER_IMAGE
```
3. Run the Notebook for finetuning.

Once the container is up and Jupyter Lab is running at [http://localhost:8888](http://localhost:8888), you can open **finetuning notebook** to begin.

4. To stop the container:
```bash
docker stop $CONTAINER_NAME
```

5. To relaunch the container

```bash
docker start $CONTAINER_NAME
docker logs $CONATINER_NAME # Identify on which port the Jupter notebook is launched - default 8888
```

6. To remove the container:
```bash
docker rm finetuning-container
```