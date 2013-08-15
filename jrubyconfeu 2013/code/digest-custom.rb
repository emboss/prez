require 'krypt'

class MyProvider

  def new_service(clazz, *args)
    if clazz == Krypt::Digest && args[0] == "identity"
      IdentityDigest.new
    else
      nil
    end
  end

  def name
    "MyProvider"
  end

  def finalize
  end
  
end

class IdentityDigest

  def initialize
    reset
  end

  def reset
    @buf = ""
  end

  def update(data)
    @buf << data
  end
  alias << update

  def digest(data=nil)
    return data if data
    digest_finalize
  end

  def hexdigest(data=nil)
    Krypt::Hex.encode(digest(data))
  end

  def digest_length
    -1
  end

  def block_length
    -1
  end

  def name
    'identity'
  end

  private

  def digest_finalize
    @buf
  end

end

data = "letest"
Krypt::Provider.register(MyProvider.new)

id = Krypt::Provider.new_service(Krypt::Digest, 'identity')
puts "Digest object:"
p id

puts id.digest(data)

sha = Krypt::Provider.new_service(Krypt::Digest, 'sha1')
puts "SHA-1: #{sha.hexdigest(data)}"     

