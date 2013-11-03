#!/bin/bash
rake db:reset
rake db:test:prepare
rake db:seed
