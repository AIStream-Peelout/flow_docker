# Flow Forecast Training Dockerfiles
This repository contains Dockerfiles needed to run Flow Forecast as a distributed Weights and Biases hyper-parameter sweep. 

1. Make a sweep YAML file of the hyperparameters you want to search for on your FF model (example in the example_sweep directory)
2. Get your WANDB_SWEEP_ID. For this you need to run `wandb sweep --project sweeps_demo config.yaml`
3. Make an environment file
In your environment file there should be the following items:

- WANDB_API_KEY
- WANDB_SWEEP_ID (this should be the full project/sweep)
- BASIC_CONFIG_PATH

Optionally you can also have:
    - ENVIRONMENT_GCP

4. Run `docker run --env-file .env_file aistream1/flow_sweep`

Your base config path file should have the JSON file with the default sweep values.