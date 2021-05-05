require 'yaml'
ROUTES = YAML.load(File.read(File.join(File.dirname(__FILE__), "app", "routes.yml"))) # 1

require "./lib/router" # 2

class App
  attr_reader :router

  def initialize 
    @router = Router.new(ROUTES) # 3
  end

  def call(env)
    result = router.resolve(env) # 4
    [result.status, result.headers, result.content] # 5
  end
end
