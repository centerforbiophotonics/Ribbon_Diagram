#ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
#                                       :access_key_id     => 'AKIAIUZF2SK6VIFSXRYA',
#                                       :secret_access_key => 'AgJym4lctB36caZlhmPdY4IZK4nN1Y+RrSumPg/pIR9Z',
#                                       :server => 'email-smtp.us-west-2.amazonaws.com'

require 'net/smtp'

module Net
  class SMTP
    def tls?
      true
    end
  end
end