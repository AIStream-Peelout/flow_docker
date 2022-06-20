from pytorch/pytorch:latest
RUN apt-get update && apt-get -y install gcc
RUN apt install -y gcc python3-dev python3-pip g++ 
RUN pip install flood_forecast
ENV WANDB_API_KEY=${WANDB_API_KEY}
ENV WANDB_SWEEP_ID=${WANDB_SWEEP_ID}
ENV BASIC_CONFIG_PATH=${BASIC_CONFIG_PATH}
ENV ENVIRONMENT_GCP=${ENVIRONMENT_GCP}
RUN apt-get install -y wget
RUN wget -O "run_flow.py" "https://raw.githubusercontent.com/AIStream-Peelout/flow_docker/master/wandb_conf.py"
RUN python run_flow.py
ENTRYPOINT wandb agent WANDB_SWEEP_ID
