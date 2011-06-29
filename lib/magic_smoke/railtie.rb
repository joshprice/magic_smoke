require 'magic_smoke'
require 'rails'

module MagicSmoke
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/magic_smoke.rake"
    end
  end
end