require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Stringer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.i18n.available_locales = ['en', 'de', 'el-GR', 'eo', 'es', 'fr',
                                     'he', 'it', 'ja', 'nl', 'pt-BR', 'pt',
                                     'ru', 'sv', 'tr', 'zh-CN']

    config.autoload_paths << Rails.root.join('app', 'commands', 'feeds')
    config.autoload_paths << Rails.root.join('app', 'commands', 'stories')
    config.autoload_paths << Rails.root.join('app', 'commands', 'users')

    config.autoload_paths << Rails.root.join('spec', 'factories')
  end
end
