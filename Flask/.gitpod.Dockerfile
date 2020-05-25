FROM gitpod/workspace-full

USER gitpod

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && \
#     sudo apt-get install -yq bastet && \
#     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/

# Install wxPython dependencies
RUN sudo apt-get -q update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq freeglut3-dev python3.7-dev libpython3.7-dev libgl1-mesa-dev libglu1-mesa-dev libgstreamer-plugins-base1.0-dev libgtk-3-dev libnotify-dev libsdl2-dev libwebkit2gtk-4.0-dev libxtst-dev libgtk2.0-dev && \
    sudo rm -rf /var/lib/apt/lists/*

# Install wxPython
RUN pip3 install -U -f https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04/ wxPython

RUN bash -cl "rustup install nightly && rustup default nightly"

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sudo sh

RUN npm i -g prettier