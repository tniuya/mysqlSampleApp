# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#MysqlSampleApp::Application.config.secret_key_base = '54caeb6a30c8533bffd84ff726f374dd3f5ed035d5fcf3e9f6301eca0b33febfa96e56d6e01c5ad0f9c5adde03cccbed2baef48692cbe25b6469e993a9001ce3'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    file.read(token_file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(token, token)
    token
  end
end

MysqlSampleApp::Application.config.secret_key_base = secure_token
