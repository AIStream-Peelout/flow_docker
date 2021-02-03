from pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime
RUN pip install wandb
RUN pip install flood_forecast
ARG WANDB_SWEEP_ID
ARG BASE_CONFIG_FILE
ARG GCP_SERVICE_KEY
ENV ENVIRONMENT_GCP GCP_SERVICE_KEY
RUN wget -O "base_config.json" BASE_CONFIG_FILE
ENTRYPOINT wandb agent WANDB_SWEEP_ID
