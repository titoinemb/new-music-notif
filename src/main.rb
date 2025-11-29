#!/usr/bin/env ruby

# import modules
require 'yaml'
require 'pathname'

# get the relative path of this file
base_dir = Pathname.new(__FILE__).dirname

# var for get the config file
file_path = base_dir.join('../config.yml')

# listing the config file
begin
  data = YAML.load_file(file_path)['bot_config']

  # verifing if minimum 1 method for notifing new music is activate
  if data.any? { |_, service| service["actif?"] }
    # if minimum 1 mothod is activate :
    
  else
    puts "Error: All notification methods are disabled. Please activate at least one method"
  end
rescue StandardError => e
  puts "Error for listing the config file : #{e.message}"
end