require 'krypt'
require 'krypt/provider/openssl'

ossl = Krypt::Provider::OpenSSL.new
Krypt::Provider.register(ossl)

digest = Krypt::Digest::SHA1.new

puts "Digest object:"
p digest

puts digest.hexdigest("letest")
