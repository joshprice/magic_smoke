require 'magic_smoke'
require 'rails'

module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :magic_smoke

    rake_tasks do
      load "lib/tasks/magic_smoke.rake"
    end
  end
end