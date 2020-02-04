require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require 'byebug'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, route_params = {})
    @params = req.params.merge(route_params)
    @req = req
    @res = res
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response ||= false
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "already built response" if already_built_response?
    session.store_session(@res)
    @res.location = url
    @res.status = 302
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "already built response" if already_built_response?
    @res['Content-Type'] = content_type
    session.store_session(@res)
    @res.write(content)  
    @already_built_response = true
  end
  
  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name) # -> :index
    raise "already built response" if already_built_response?
    template_path = File.join("views", self.class.to_s.underscore, template_name.to_s + ".html.erb") # -> views/cats_controller/index.html.erb
    template_file = File.read(template_path)
    template = ERB.new(template_file)
    render_content(template.result(binding), "text/html")
  
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    self.send(name)
    render(name) unless already_built_response?
    
  end
end

