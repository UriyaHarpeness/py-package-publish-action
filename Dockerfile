FROM python:3

RUN apt-get update
RUN apt-get install -y jq

ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

RUN echo $PYTHON_VERSION
RUN pyenv install $PYTHON_VERSION
RUN pyenv global $PYTHON_VERSION
RUN pip install --upgrade setuptools wheel twine

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
