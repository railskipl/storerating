PayPal::SDK.load('config/paypal.yml',  ENV['RACK_ENV'] || 'development')
PayPal::SDK.logger = Rails.logger

require 'paypal-sdk-rest'
include PayPal::SDK::REST
PayPal::Recurring.configure do |config|
  config.sandbox = true
  config.username = "seller_ntest_api1.gmail.com"
  config.password = "1392122027"
  config.signature = "AFcWxV21C7fd0v3bYYYRCpSSRl31ABqNIRPCxoa9T4K.DHlBtwg-AKhU"
  
  
end