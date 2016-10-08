config.action_mailer.default_url_options = { host: 'xls12.herokuapp.com' }
config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    #:domain               => 'baci.lindsaar.net',
    :user_name            => 'onlinesticker12151@gmail.com',
    :password             => 'Nagaraju@2015', #'dinemedia!@#',
    :authentication       => 'plain',
    
    :enable_starttls_auto => true

  }