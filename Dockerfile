FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY start.sh /app/
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
