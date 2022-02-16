# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://readbooktracker.herokuapp.com'
    resource '/auth/login',
      :headers => :any,
      :methods => [:post]
    resource '/signup',
      headers: :any,
      methods: [:post, :head]
    resource '/users/:user_id/books',
      headers: :any,
      methods: [:get, :head]
    resource '/users/:user_id/books',
      headers: :any,
      methods: [:post, :head]
    resource '/measurments',
      headers: :any,
      methods: [:post, :head]
    resource '/users/:user_id/measurments',
      headers: :any,
      methods: [:get, :head]
    resource '/cats',
      headers: :any,
      methods: [:get, :head]
  end
end
