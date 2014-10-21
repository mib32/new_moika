Robokassa::Interface
module Robokassa
  class Interface
      def self.get_options_by_notification_key(key)
        robo_cred_path = "config/robokassa.yml"
        robo_cred  = YAML.load_file(robo_cred_path)[Rails.env]
        {
          login: robo_cred[:login],
          password1: robo_cred[:password1],
          password2: robo_cred[:password2]
        }
        # {
        #   test_mode: true,
        #   login: 'test.moika,
        #   password1: robo_cred[:password1],
        #   password2: robo_cred[:password2]
        # }
      end      
    class << self

      def success_implementation(invoice_id, *args)
        Payment.find(invoice_id).confirm!
      end

      def fail_implementation(invoice_id, *args)
        Payment.find(invoice_id).mark_failed!
      end

      def notify_implementation(invoice_id, *args)
        Payment.find(invoice_id).verifity!
      end
    end
  end

  def self.client
    Interface.new Interface.get_options_by_notification_key(nil)
  end
end
