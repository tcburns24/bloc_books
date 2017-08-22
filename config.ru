require './config/application'
app = BlocBooks::Application.new

use Rack::ContentType

app.route do
  map "", "books#welcome", default: { "request" => "GET" }
  map "/books/welcome1", "books#welcome1", default: { "request" => "GET" }
  map "/books/welcome2", "books#welcome2", default: { "request" => "GET" }
  map "/books/welcome3", "books#welcome1", default: { "request" => "GET" }
  map "/books/welcome4", "books#welcome2", default: { "request" => "GET" }
  map "/books/farewell", "books#farewell", default: { "request" => "GET" }

  resources :books
end

run(app)

# books/:id/author
# books/(.*)/author
