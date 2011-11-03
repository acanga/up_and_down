ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "52.0.4.7",
  :domain => "52.0.4.7",
  :port => 25
}