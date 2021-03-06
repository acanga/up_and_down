UpAndDown::Application.configure do
  config.cache_classes = true
  config.action_controller.perform_caching = true

  config.consider_all_requests_local = false
  config.active_support.deprecation = :notify

  config.serve_static_assets = true
  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = true
  config.assets.precompile += %w(admin/admin.css admin/admin.js plugins.js.erb)

  config.i18n.fallbacks = true

  config.action_mailer.default_url_options = { :host => "up-and-down.com" }
end