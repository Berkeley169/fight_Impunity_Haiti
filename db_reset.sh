#!/bin/bash
rake db:drop
rake db:migrate
rake db:drop RAILS_ENV=test
rake db:migrate RAILS_ENV=test
