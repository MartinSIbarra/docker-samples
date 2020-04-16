FROM rails:init

#Setting aliases for developer
RUN echo "# Custom aliases:" >> /home/developer/.bashrc  && \
    echo "alias a='clear && ls -la --color'" >> /home/developer/.bashrc  && \
    echo "alias l='ls -la --color'" >> /home/developer/.bashrc

WORKDIR /home/developer/app/railsapp

#Getting a base Gemfile
COPY --chown=developer:developer ./rails/Gemfile .
COPY --chown=developer:developer ./rails/Gemfile.lock .

#Installing Gems
RUN bundle install

#Exposing ports
EXPOSE 3000