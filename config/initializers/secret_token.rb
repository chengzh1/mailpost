# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#MailPost::Application.config.secret_key_base = 'b5862dfcc87b7923ffcd94e2bf02a82959c32dc5db1d40f6c9b50be71d024aacbb0575f5abf5cf5aa3200c967f3dd453f6521e3132b74602ec77f134b2db4402'

#change to dynamic secret token

require 'securerandom'

def secure_token
  #Rails.root = #<Pathname:/Users/mac/Documents/CMU/ruby/rails_projects/mail_post>
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # User the existing token
    File.read(token_file).chomp
  else
    # Generate a new token and store it in the token file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

#to protect session variables
MailPost::Application.config.secret_key_base = secure_token
