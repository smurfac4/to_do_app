require './config/environment'
ActiveRecord::Base.connection.execute("DELETE FROM schema_migrations WHERE version='20260531203030'")
puts 'deleted'
