Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.assets.version = '1.0'
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false

  if ENV["STAGING"]
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default_url_options = { :host => "http://gdicchicago-staging.herokuapp.com" }
    config.action_mailer.smtp_settings = {
      :user_name => '20848c62d28739702',
      :password => 'eb6bea007c4395',
      :address => 'mailtrap.io',
      :domain => 'mailtrap.io',
      :port => '2525',
      :authentication => :cram_md5,
      :enable_starttls_auto => true
    }
  else
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.sendgrid.net',
      port:                 '587',
      authentication:       :plain,
      user_name:            ENV['SENDGRID_USERNAME'],
      password:             ENV['SENDGRID_PASSWORD'],
      domain:               'heroku.com',
      enable_starttls_auto: true
    }
  end

end
