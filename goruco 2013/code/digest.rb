require 'krypt'

digest = Krypt::Digest::SHA1.new

p digest
puts digest.hexdigest("letest")

