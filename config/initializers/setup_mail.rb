ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 25,
  :domain               => "google.com",
  :user_name            => "rubyrails9@gmail.com",
  :password             => "kipl123!@#",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
ActionMailer::Base.default_url_options[:host] = "http://storerating.herokuapp.com"
