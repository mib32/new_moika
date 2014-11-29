class SystemMailer < ActionMailer::Base
  default from: "info@moika-77.ru"

  def new_request_happen car_wash, request
    to = []
    to << 'mibus32@gmail.com'
    to << 'progress-msc@mail.ru' if Rails.env == 'production'

    to << car_wash.users.map(&:email)

    @request = request
    @car_wash = car_wash
    mail(to: to.flatten, subject: 'Мойка-77: Поступила новая заявка')
  end

  def new_registration_happen user
    to = []
    to << 'mibus32@gmail.com'
    to << 'progress-msc@mail.ru' if Rails.env == 'production'

    @user = user
    mail(to: to.flatten, subject: 'Мойка-77: Новая регистрация')
  end
end
