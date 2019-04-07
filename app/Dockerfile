FROM python:3.5.2-slim
WORKDIR /app
COPY . /app
RUN pip install --trusted-host pypi.python.org -r requirements.txt
EXPOSE 4000
ENV FLASK_APP app.py
CMD ["gunicorn", "-b", ":4000", "app:app"]
