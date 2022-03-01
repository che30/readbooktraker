# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors
Rails.application.config.middleware.insert_before 0, Rack::Cors do
allow do
  origins 'https://read-book-tracker-front-end.herokuapp.com'

  resource '/auth/login',
    :headers => :any,
    :methods => [:post]
  resource '/signup',
    headers: :any,
    methods: [:post, :head]
  resource '/api/users/:user_id/books',
    headers: :any,
    methods: [:get, :options, :head]
  resource '/api/users/:user_id/books',
    headers: :any,
    methods: [:post, :options, :head]
  resource '/api/user-measurements',
    headers: :any,
    methods: [:get, :options, :head]
  resource '/api/users/user_id/books/book_id/measurements',
    headers: :any,
    methods: [:post, :head]
  resource '/api/categories',
    headers: :any,
    methods: [:get, :options, :head]
end
end
# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins '*'
#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end