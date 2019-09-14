require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.generators do |g|
      g.test_framework = 'rspec'
      g.helper_specs = false    # helper用のspecファイルは生成しない
      g.view_specs = false      # view用のspecファイルは生成しない
    end
  end
end
