require './config/application'
app = BlocBooks::Application.new

use Rack::ContentType

app.route do
  map "", "books#welcome"
  map ":controller/:id/:action" # (.*)/(.*)/(.*)
  map ":controller/:id", default: { "action" => "show" }
  map ":controller", default: { "action" => "index" }

  map "/hello/world", default: { "action" => "hello_world", "request" => "GET" } # I want this to work for GET

  resources :books
end

run(app)

# books/:id/author
# books/(.*)/author
