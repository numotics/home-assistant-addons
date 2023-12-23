ARG BUILD_FROM
FROM $BUILD_FROM

# Install Whisper dependencies
RUN apk update && \
    apk add --no-cache \
        build-base \
        python3 \
        python3-dev \
        py3-pip \
        jq

# Set working directory
WORKDIR /usr/src

# Arguments
ARG PACKAGE_VERSION='0.0.1'

# Install and configure Whisper
RUN pip3 install --no-cache-dir -U \
        setuptools \
        wheel && \
    pip3 install --no-cache-dir \
        -i https://test.pypi.org/simple/ \
        --extra-index-url https://pypi.org/simple/ \
        "wyoming_openai_audio_api==${PACKAGE_VERSION}"

# Clean up
RUN apk del build-base python3-dev && \
    rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /

# Copy run script
COPY run.sh ./

# Expose port
EXPOSE 10300

# Set entry point
ENTRYPOINT ["bash", "/run.sh"]
