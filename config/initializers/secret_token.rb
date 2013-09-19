# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Iapp::Application.config.secret_key_base = '9247ff344a4cec7874e9c4ad2f0ccc614f9f9b58a4264bc257109367bef9a0f2895fe8e7cce2371d234aafc4838f8757c0185c6b7c2ac9b05451b60d7f202481'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Iapp::Application.config.secret_key_base = secure_token