FROM python:3.9.0-windowsservercore
RUN setup.exe -q -n -P openssh git graphviz gcc
RUN python -m pip install --upgrade pip setuptools wheel pyparsing pydot django-extensions django

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
