FROM metagpt/metagpt:v0.3.1

ARG OPENAI_API_KEY
ENV OPENAI_API_KEY=$OPENAI_API_KEY

WORKDIR /app

RUN sed -i '1i\#!\/usr\/bin\/env python' metagpt/startup.py
RUN chmod +x metagpt/startup.py

RUN sed -i 's/https:\/\/api.openai.com\/v1/https:\/\/api.openai-forward.com\/v1/g' metagpt/config/config.yaml
RUN sed -i 's/gpt-4/gpt-3.5-turbo-16k/g' metagpt/config/config.yaml
RUN sed -i "s/YOUR_API_KEY/${OPENAI_API_KEY}/g" metagpt/config/config.yaml
RUN sed -i '9,/OPENAI_API_KEY/s/#//' metagpt/config/config.yaml

CMD ["sh", "-c", "tail -f /dev/null"]
