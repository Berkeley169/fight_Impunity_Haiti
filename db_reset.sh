#!/bin/bash
rake db:drop
rake db:create
rake db:migrate
rake db:test:prepare
rake db:seed
