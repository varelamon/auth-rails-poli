# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Auth::Application.config.secret_key_base = '41e794fd762e31536a3ac8e4b7f1bd0ea18923387228f1d781373366a25d97ed24029f8a802bbbdda828c6ff5a6af2930bb35325f51f1be21be40a58f744257a'
