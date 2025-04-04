# Use an base image
FROM intel/intel-extension-for-pytorch:2.6.10-xpu-pip-jupyter
 
# Set the working directory in the container
WORKDIR /finetuning
 
# Set environment variables
ENV ZE_AFFINITY_MASK=1
ENV SHM_SIZE=16g
 
# Install any needed packages specified
 
RUN pip cache purge && \
    pip install --upgrade transformers datasets trl peft accelerate scipy sentencepiece ipywidgets
 
# Expose Jupyter Notebook port
EXPOSE 8888
 
# Set the working directory in the container
RUN cd /finetuning
 
# Set the entrypoint to start Jupyter Lab
ENTRYPOINT ["jupyter-lab", "--allow-root","--port", "8888"]