FROM python:3

RUN python -m pip install --upgrade pip setuptools wheel pyparsing pydot django-extensions django

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
