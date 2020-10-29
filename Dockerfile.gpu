FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime
RUN git clone https://github.com/AIStream-Peelout/flow-forecast.git
WORKDIR "flow-forecast"
RUN pip install wandb>=0.10.7
RUN pip install -r requirements.txt
RUN python setup.py develop
ENTRYPOINT 
