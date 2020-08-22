require 'action_mailer'

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  domain: 'gmail.com',
  port: 587,
  user_name: ENV['EMAIL_ADDRESS'],
  password: ENV['PASS'],
  authentication: 'plain',
  enable_starttls_auto: true
}