FROM metagpt/metagpt:v0.3.1

ARG OPENAI_API_KEY
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

WORKDIR /app
COPY ./entrypoint.sh /app/metagpt/

RUN sed -i -e 's/https:\/\/api.openai.com\/v1/https:\/\/api.openai-forward.com\/v1/g' \
  -e 's/gpt-4/gpt-3.5-turbo-16k/g' \
  -e "s/YOUR_API_KEY/${OPENAI_API_KEY}/g" \
  -e '9,/OPENAI_API_KEY/s/#//' metagpt/config/config.yaml

RUN sed -i -e '1i\#!/usr/bin/env python' metagpt/startup.py
RUN chmod +x metagpt/startup.py

CMD ["tail", "-f", "/dev/null"]
