require 'digest/md5'

class RobokassaController < Robokassa::Controller
  ROBO_CRED_PATH = "config/robokassa.yml"
  ROBO_CRED  = YAML.load_file(ROBO_CRED_PATH)[Rails.env]
  def notify
    super
    @car_wash = CarWash.find(params[:shpcar_wash_id])
    password2 = ROBO_CRED[:password2]
    hash_string = [params[:OutSum],params[:InvId],password2,"shpcar_wash_id=#{params[:shpcar_wash_id]}"].join(":")
    hash = Digest::MD5.hexdigest(hash_string)
    if hash == params[:SignatureValue]
      @car_wash.premial_status = 'paid'
    end
    logger.info "hash: #{hash.inspect} #{params.inspect}"
  end
  def success
    super
    @car_wash = CarWash.find(params[:shpcar_wash_id])
    @payment = @car_wash.payments.find(params[:InvId])
    redirect_to edit_car_wash_path(@car_wash), notice: "Ваш платеж на сумму #{@payment.amount} руб. успешно принят. Спасибо!"
  end

  def fail
    super
    @car_wash = CarWash.find(params[:shpcar_wash_id])
    @payment = @car_wash.payments.find(params[:InvId])
    redirect_to edit_car_wash_path(@car_wash), warning: "Во время принятия платежа возникла ошибка. Мы скоро разберемся!"
  end

  def get_options_by_notification_key(key)

    {
      test_mode: true,
      login: ROBO_CRED[:login],
      password1: ROBO_CRED[:password1],
      password2: ROBO_CRED[:password2]
    }
    # {
    #   test_mode: true,
    #   login: 'test.moika,
    #   password1: robo_cred[:password1],
    #   password2: robo_cred[:password2]
    # }
  end


end
