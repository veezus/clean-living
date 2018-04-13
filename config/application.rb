environment = ENV['CLEAN_LIVING_ENV'] || 'development'
root = File.dirname __FILE__

require 'bundler'
Bundler.require :default, environment

ActiveRecord::Base.logger = Logger.new "db/#{environment}.log"

configuration = YAML::load IO.read('db/config.yml')
ActiveRecord::Base.establish_connection configuration[environment]

Dir[File.join(root, '..', 'lib', 'modules', '*.rb')].each do |file|
  require file
end

Dir[File.join(root, '..', 'lib', '*.rb')].each do |file|
  require file
end

Dir[File.join(root, '..', 'app', 'commands', '*.rb')].each do |file|
  require file
end

Dir[File.join(root, '..', 'app', 'models', '*.rb')].each do |file|
  require file
end
