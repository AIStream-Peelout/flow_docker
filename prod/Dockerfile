FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime
RUN git clone https://github.com/AIStream-Peelout/flow-forecast.git
WORKDIR "flow-forecast"
RUN pip install wandb>=0.10.7
RUN pip install -r requirements.txt
RUN pip install fastapi
RUN python setup.py develop
ARG FILE_URL
ENTRYPOINT python infer.py -c $FILE_URL -m api
