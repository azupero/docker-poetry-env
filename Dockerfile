FROM python:3.8-buster

ENV PYTHONUNBUFFERED=1

# # mecab
# RUN apt-get update \
#     && apt-get upgrade -y \
#     && apt-get install -y mecab libmecab-dev mecab-ipadic-utf8 \
#     && apt-get install -y git make curl xz-utils file sudo \
#     && ln -s /etc/mecabrc /usr/local/etc/mecabrc

# # neologd
# # /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd
# RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git \
#     && cd mecab-ipadic-neologd \
#     && bin/install-mecab-ipadic-neologd -n -y

WORKDIR /working

# pip update
RUN pip install --upgrade pip

# poetry
COPY ./poetry.lock ./pyproject.toml ./

RUN pip install poetry \
    && poetry config virtualenvs.create false \
    # && poetry config virtualenvs.in-project true \
    && poetry install

# streamlit demo
COPY ./main.py ./

# config and clean up
RUN ldconfig \
    && apt-get clean \
    && apt-get autoremove

CMD ["poetry","run","streamlit","run","main.py"]
