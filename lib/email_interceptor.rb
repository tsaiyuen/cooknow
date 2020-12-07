class EmailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.subject}"
    message.to = [ 'info@cooknow.club' ]
  end
end
