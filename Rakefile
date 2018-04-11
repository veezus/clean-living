require 'standalone_migrations'

StandaloneMigrations::Tasks.load_tasks

desc "Run an irb session with the application loaded"
task :console do
  exec "irb -r ./config/application.rb"
end
