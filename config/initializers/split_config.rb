Split.configure do |config|
  config.db_failover = true
  config.db_failover_on_db_error = proc{|error| Rails.logger.error(error.message)}
  config.allow_multiple_experiments = true
  config.persistence = Split::Persistence::SessionAdapter
  config.include_rails_helper = true
  config.redis_url = "localhost:6379"
  config.persistence = :cookie
  config.persistence_cookie_length = 30.days
end

Split::Dashboard.use Rack::Auth::Basic do |username, password|
  username = 'admin'&& password='secret'
end