class RegistrationMailer < ActionMailer::Base
  default from: "testdummymonkey@gmail.com"

  def new_registration_email(user)
  	
  	@user = user
  	mail(to: user.email,
  		subject: 'Verificatie Account')
  end
end
