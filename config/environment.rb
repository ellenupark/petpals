# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

  configure :production do
    db = URI.parse(ENV['HEROKU_POSTGRESQL_SILVER'] || 'postgres://localhost/mydb')
  
    ActiveRecord::Base.establish_connection(
      :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
    )
  end