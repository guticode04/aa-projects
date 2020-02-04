require 'rack'
require 'byebug'
# Rack::Server.start(
#   app: Proc.new do |env|
#     ['200', {'Content-Type' => 'text/html'}, ['hello world']]
#   end
# )

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  # debugger
  res['Content-Type'] = 'text/html'
  res.write(req.path_info)
  res.finish
end

Rack::Server.start(
  app:app, Port: 3000
)



# http://localhost:9292/