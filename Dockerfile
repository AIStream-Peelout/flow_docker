from pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime
RUN apt-get update && apt-get -y install gcc
RUN apt install -y gcc python3-dev python3-pip g++ 
RUN pip install wandb
RUN pip install flood_forecast
ENV WANDB_API_KEY=${WANDB_API_KEY}
ENV WANDB_SWEEP_ID=${WANDB_SWEEP_ID}
ENV BASIC_CONFIG_PATH=${BASIC_CONFIG_PATH}
ENV ENVIRONMENT_GCP=${ENVIRONMENT_GCP}
RUN apt-get install -y wget
ENTRYPOINT wandb agent WANDB_SWEEP_ID
