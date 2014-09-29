class SystemMailer < ActionMailer::Base
  default from: "info@moika-77.ru"

  def new_request_happen car_wash, request
    to = []
    to << 'mibus32@gmail.com'
    to << 'progress-msc@mail.ru'

    to << car_wash.users.map(&:email)

    @request = request
    @car_wash = car_wash
    mail(to: to.flatten, subject: 'Поступила новая заявка')
  end
end
