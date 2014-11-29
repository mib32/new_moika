# -*- encoding : utf-8 -*-
ROBO_CRED_PATH = "config/robokassa.yml"
ROBO_CRED  = YAML.load_file(ROBO_CRED_PATH)[Rails.env]
require 'digest/md5'

Rubykassa.configure do |config|
  config.login = ROBO_CRED[:login]
  # config.login = 'test.moika-77.ru'
  config.first_password = ROBO_CRED[:password1]
  # config.first_password = '12345678V'
  config.second_password = ROBO_CRED[:password2]
  # config.second_password = '12345678A'
  config.mode = :production # or :production
  config.http_method = :get # or :post
  config.xml_http_method = :get # or :post


  # Result callback is called in RobokassaController#paid action if valid signature
  # was generated. It should always return "OK#{ invoice_id }" string, so implement
  # your custom logic above `render text: notification.success` line

  config.result_callback = ->(notification) { 
    @car_wash = CarWash.find(params[:shpcar_wash_id])
    # byebug
    # password2 = ROBO_CRED[:password2]
    # hash_string = [params[:OutSum],params[:InvId],password2,"shpcar_wash_id=#{params[:shpcar_wash_id]}"].join(":")
    # hash = Digest::MD5.hexdigest(hash_string)
    # if hash.upcase == params[:SignatureValue]
    @car_wash.premial_status = 'paid'
    @car_wash.save! 
    # end
    # logger.info "#{hash.inspect} #{params.inspect}"
    render text: notification.success 
  }

  # Define success or failure callbacks here like:

  config.success_callback = ->(notification) {
    @car_wash = CarWash.find(params[:shpcar_wash_id])
    @payment = @car_wash.payments.find(params[:InvId])
    redirect_to edit_car_wash_path(@car_wash), notice: "Ваш платеж на сумму #{@payment.amount} руб. успешно принят. Спасибо!"
  }

  config.fail_callback = ->(notification) {
    @car_wash = CarWash.find(params[:shpcar_wash_id])
    @payment = @car_wash.payments.find(params[:InvId])
    redirect_to edit_car_wash_path(@car_wash), alert: "Во время принятия платежа возникла ошибка. Мы скоро разберемся!"
  }
end
