FROM bash:5

# Specify commit sha for reproducible images
ARG commit="81b1373f"

# Set labels
LABEL org.opencontainers.image.title="wait-for-it"
LABEL org.opencontainers.image.description="Waits on the availability of a host and TCP port"
LABEL org.opencontainers.image.source="https://github.com/krakowski/wait-for-it-docker"
LABEL org.opencontainers.image.revision="${commit}"
LABEL org.opencontainers.image.licenses="MIT"

# Add wait-for-it script in container's PATH
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/${commit}/wait-for-it.sh /bin/wait-for-it

# Make wait-for-it script executable
RUN chmod +x /bin/wait-for-it

# Execute wait-for-it script on entry
ENTRYPOINT ["wait-for-it"]
