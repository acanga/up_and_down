require File.expand_path("../boot", __FILE__)

require "rails/all"

if defined?(Bundler)
  Bundler.require *Rails.groups(:assets => %w(development test))
end

module UpAndDown
  class Application < Rails::Application
    config.autoload_paths += %W(
      #{config.root}/lib
      #{config.root}/app/models/concerns
    )

    config.encoding = "utf-8"    
    config.i18n.default_locale = "pt-BR"
    config.active_record.identity_map = true
    config.filter_parameters += [:password, :password_confirmation]
    
    config.assets.enabled = true
    config.assets.version = "1.0"
    config.assets.initialize_on_precompile = false
  end
end

require_dependency File.join(Rails.root, "lib", "excel")
require_dependency File.join(Rails.root, "lib", "excelx")