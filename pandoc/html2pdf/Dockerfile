FROM debian:sid-slim
LABEL org.opencontainers.image.description="Headless Chrome for HTML-to-PDF conversion using only Roboto, Liberation and Windows fonts "
# Much inspired by https://www.baeldung.com/ops/docker-google-chrome-headless
WORKDIR /workspace
# Windows fonts are available only on the contrib repo.
# The fonts-roboto package does not include the Roboto Mono variant! Download it from github.
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y software-properties-common wget gnupg dbus-x11 fontconfig fonts-liberation fonts-roboto && \
    apt-add-repository contrib && \
    apt-get install --no-install-recommends -y ttf-mscorefonts-installer && \
    wget https://github.com/googlefonts/RobotoMono/archive/refs/tags/v3.001.tar.gz -O RobotoMono.tar.gz && \
    tar xvzf RobotoMono.tar.gz && \
    cp -r RobotoMono-3.001/fonts/ttf /usr/share/fonts/truetype/roboto-mono && \
    fc-cache -f && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub |  gpg --dearmor -o /usr/share/keyrings/google-linux-keyring.gpg && \
    sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-linux-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    apt-get update -y && \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/dbus
# Create non-root user
RUN useradd -m chromeuser && chown chromeuser:chromeuser /run/dbus

# Switch to non-root user
USER chromeuser

# "fake" dbus address to prevent errors
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS="unix:path=/run/dbus/system_bus_socket"

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN fc-list

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh"]
# docker run --rm -v /tmp:/workspace ghcr.io/oasis-tcs/chrome-headless:latest --print-to-pdf="acal-core-v1.0.pdf" "file:///workspace/acal-core-v1.0.html"
