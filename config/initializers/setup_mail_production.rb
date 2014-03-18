# config/initializers/setup_mail_production.rb

if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['app22790807@heroku.com'],
    password:       ENV['skmahmje'],
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end