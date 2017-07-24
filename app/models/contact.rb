class Contact < MailForm::Base
  attribute :name,      :validates => true
  attribute :email,     :validates => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validates => true
  attribute :nickname,  :captcha   => true

def headers
  {
  :subject => "Contact Form",
  :to => "soporte.colegio.sw@gmail.com",
  :from => %("#{name}" <#{email}>)
  }
end

end
