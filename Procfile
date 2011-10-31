web: bundle exec unicorn_rails -p $PORT -c ./config/unicorn.rb            
resque: bundle exec rake resque:work QUEUE=stockholder_base_report_parser