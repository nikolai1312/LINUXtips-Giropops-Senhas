FROM cgr.dev/chainguard/python:latest-dev as build 

WORKDIR /giropops

COPY requirements.txt .

RUN pip install --no-cache-dir -r ./requirements.txt

ENV PATH="$PATH:/home/nonroot/.local/bin"

COPY app.py .

COPY templates/ templates/

COPY static/ static/

EXPOSE 5000

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
