# Use the official Python image.
FROM python:3.10

# Set the working directory inside the container.
WORKDIR /app

# Copy the requirements file.
COPY requirements.txt .

# Install the dependencies.
RUN pip install --upgrade pip==23.0.1
RUN pip install -r requirements.txt

# Copy the entire application folder.
COPY . .

# Set environment variables
ENV DJANGO_SETTINGS_MODULE=django_api_financial.settings
ENV PYTHONUNBUFFERED=1
#ENV PORT=8200

# Expose the port
EXPOSE 8000

ENV PYTHONPATH=/app/django_api_financial
# Run the Django application
#CMD ["python", "django_api_financial/manage.py", "runserver", "0.0.0.0:8000"]
#CMD ["sh", "-c", "python django_api_financial/manage.py runserver 127.0.0.1:8000"]
CMD ["gunicorn", "django_api_financial.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "1", "--threads", "1", "--timeout", "120"]