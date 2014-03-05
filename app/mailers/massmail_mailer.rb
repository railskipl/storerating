class MassmailMailer < ActionMailer::Base
  default from: "admin@storerating.com"

  # def registration_confirmation(massmail)
  #     @massmail = massmail
  #     mail(:to => massmail.email, :subject => "Registered")
  # end

# def registration_confirmation(massmail)
#       @massmail = massmail
#         eval(massmail.email).reject(&:empty?).each do |email|
#           mail(:to => email, :subject => "Registered")
#       end
#   end


def registration_confirmation(massmail)
    @massmail = massmail
    eval(massmail.email).each do |email|
      mail(:to => email, :subject => "Registered")
    end
  end


 def suspended_confirmation(user,reason)   
     @user = user
      mail(:to => user.email, :subject => "Suspended")
  end

end
