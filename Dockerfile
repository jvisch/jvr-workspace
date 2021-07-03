FROM jvr/ros2:foxy-ros-base

## PlantUML (VSCode extension)
# Java and graphiz needed for PlantUML (extension VSCode)
RUN apt update && apt install -y \
    default-jre \
    graphviz

## Pandoc (latest version)
# curl
RUN apt update && apt install -y \
    curl

# The pandoc version (needs to be set on build-args)
ARG PANDOC_VERSION

# download and install pandoc (and installation deb file)
ARG PANDOC_DEB_FILE=pandoc.deb
RUN curl -L -o ${PANDOC_DEB_FILE} https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb
RUN apt install -y \
    ./${PANDOC_DEB_FILE}
RUN rm ${PANDOC_DEB_FILE}

