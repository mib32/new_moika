MAUTH_CREDENTIALS_PATH = "config/mauth.yml"
MAUTH_CREDENTIALS = YAML.load_file(MAUTH_CREDENTIALS_PATH)[Rails.env]
# byebug
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.yandex.ru",
  :port                 => 465,
  :domain               => "smtp.yandex.ru",
  :user_name            => "info@moika-77.ru",
  :password             => MAUTH_CREDENTIALS[:info][:secret],
  :authentication       => :login,
  :enable_starttls_auto => true,
  :tls                  => true
}