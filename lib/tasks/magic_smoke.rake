# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/environment', __FILE__)
require 'rake'

Communities::Application.load_tasks

#config
CONFIG = <<-DSL
  
DSL

class Routes
  class << self
    def all
      Rails.application.reload_routes!
      @all ||= Rails.application.routes.routes
      @all.map { |r| r.path.gsub!("(.:format)", ""); r }
    end
  
    def get_requests
      all.select { |r| r.verb == "GET" || r.verb.blank? }
    end
  
    def get_requests_with_no_params
      get_requests.reject { |r| r.path =~ /:/ }
    end
  end
end

desc 'A magical smoke test suite'
namespace :magic_smoke do
  
  desc 'Tests all the GET requests with no parameters in your routes'
  task :routes => :environment do
    mock_request = Rack::MockRequest.new(Rails.application)

    puts "Testing GETs..."
    # ap Routes.get_requests_with_no_params
    Routes.get_requests_with_no_params.each do |route|
      #response = Rails.application.call(Rack::MockRequest.env_for("http://localhost:3000/#{route.path}"))
      response = mock_request.get("http://localhost:3000/#{route.path}")
      puts "#{response[0]} #{route.path}"
    end
  end
  
end