#!/usr/bin/env rake
require 'sinatra/activerecord/rake'
require 'dotenv/tasks'

namespace :db do
  task :load_config do
    require "./app"
  end
end

task :app => :dotenv do
  require './app'
end
