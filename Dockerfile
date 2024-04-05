# Use Alpine Linux as the base image
FROM alpine:latest

# Install PHP and Git
RUN apk update && apk add --no-cache php git php82-mbstring 

# Set the working directory in the container
WORKDIR /app

# Clone the repository and set up the PHP server
RUN git clone --recursive https://github.com/patriciogonzalezvivo/thebookofshaders.git
WORKDIR /app/thebookofshaders
RUN git submodule foreach git submodule init && git submodule update

# Copy the modified php.ini file into the container
COPY php.ini /etc/php82/php.ini

# Expose the port
EXPOSE 8000

# Start the PHP server
CMD ["php", "-S", "0.0.0.0:8000"]
