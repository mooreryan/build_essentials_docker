FROM ruby:2.6-stretch
LABEL maintainer="moorer@udel.edu"

ARG bindir=/usr/local/bin

# Update package manager
RUN apt-get update && apt-get upgrade -y

# Build essential has stuff like gcc, make, and libc6-dev
RUN apt-get install -y build-essential
RUN apt-get install -y valgrind
RUN apt-get install -y cmake
RUN apt-get install -y nano
RUN apt-get install -y less
RUN apt-get install -y tree

# Ripgrep
RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb
RUN dpkg -i ripgrep_11.0.1_amd64.deb

# Ceedling for C unit tests
RUN gem install ceedling

# Some shell stuff
RUN echo 'export PS1="[\u@build_essentials \W] -> "' >> /etc/bash.bashrc

# Scroll up and down through history
RUN echo "bind '\"\e[A\": history-search-backward'" >> /etc/bash.bashrc
RUN echo "bind '\"\e[B\": history-search-forward'" >> /etc/bash.bashrc

# Some aliases
RUN echo "alias ls='ls --color'" >> /etc/bash.bashrc
RUN echo "alias l='ls --color'" >> /etc/bash.bashrc
RUN echo "alias ls1='ls -1 --color'" >> /etc/bash.bashrc
RUN echo "alias ls2='ls -1 --color'" >> /etc/bash.bashrc
RUN echo "alias lsl='ls -lah --color'" >> /etc/bash.bashrc
RUN echo "alias lst='ls -laht --color'" >> /etc/bash.bashrc
RUN echo "alias lss='ls -lahS --color'" >> /etc/bash.bashrc
RUN echo "alias b='cd ..'" >> /etc/bash.bashrc
RUN echo "alias bb='cd ../..'" >> /etc/bash.bashrc
RUN echo "alias bbb='cd ../../..'" >> /etc/bash.bashrc
RUN echo "alias bbbb='cd ../../../..'" >> /etc/bash.bashrc
