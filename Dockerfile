FROM ruby:2.6.2 as Builder

## App path
## ARG APP_PATH=/opt/app/
## WORKDIR $APP_PATH
## 
## # Copy app with gems from former build stage
## COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
## COPY --from=Builder --chown=1000:1000 $APP_PATH $APP_PATH
## 
## RUN chown -R 1000:1000 $APP_PATH
## 
## ENV RAILS_ENV production
## 
## EXPOSE 3000
## 
## ENTRYPOINT ["/opt/app/entrypoint.sh"]
## CMD ["bundle", "check"]



ARG APP_PATH=/opt/app/
WORKDIR $APP_PATH

COPY . $APP_PATH

# Install gems
RUN gem install bundler --version 2.1.4
RUN bundle config --global frozen 1
RUN bundle config without development test
  # Remove unneeded files (cached *.gem, *.o, *.c)
RUN rm -rf /usr/local/bundle/cache/*.gem
RUN find /usr/local/bundle/gems/ -name "*.c" -delete
RUN find /usr/local/bundle/gems/ -name "*.o" -delete

RUN bundle install

ENV RAILS_ENV production

EXPOSE 3000

#ENTRYPOINT [ "/opt/app/entrypoint.sh" ]
CMD [ "bundle", "exec", "rails", "server", "-e", "production", "-b", "0.0.0.0" ]
#CMD bundle exec rails s -b 0.0.0.0 -p 3000

# should I use a linux image?



# CHANGE TO POSTGRESQL AND RETRY TO RUN DOCKER-COMPOSE UP