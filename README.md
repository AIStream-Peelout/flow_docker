# Flow Forecast Training Dockerfiles
This repository contains Dockerfiles needed to run Flow Forecast as a distributed Weights and Biases hyper-parameter sweep. 

Run 

`docker run --env_file .env_file aistream1/flow_sweep`

In your environment file there should be the following items

- WANDB_API_KEY
- WANDB_SWEEP_ID (this should be the full project/sweep)
- BASIC_CONFIG_PATH

Optionally you can also have 
    - ENVIRONMENT_GCP