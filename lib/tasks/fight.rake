#!/usr/bin/env rake
require 'yaml'

LANGS = ['en', 'es', 'fr', 'ht']
task :t, [:keyword] => :environment do |task, args|
  keyword = args.keyword
  LANGS.each do |lang|
    filename = "config/locales/#{lang}.yml"
    file = YAML::load_file(filename)
    file[lang][keyword] = "\#!\# #{keyword}"
    File.open(filename, 'w+') { |f| f.write(file.to_yaml) }
  end
end