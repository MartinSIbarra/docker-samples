FROM ruby:2.6

#Installing sudo
RUN apt update && apt install -y sudo

#Creating user developer
RUN useradd -ms /bin/bash developer --uid 1000
RUN echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#Changing to user developer
USER developer
WORKDIR /home/developer/app
RUN sudo chown -R developer:developer /home/developer

#Installing Rails
RUN sudo apt update && sudo apt install -y sqlite3 nodejs
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
ENV PATH /home/developer/.yarn/bin:$PATH
RUN gem install rails