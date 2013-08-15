require 'krypt'

digest = Krypt::Digest::SHA1.new

puts "Digest object:"
p digest.inspect
puts digest.hexdigest("letest")

