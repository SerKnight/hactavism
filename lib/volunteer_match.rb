require 'date'
require 'base64'
require 'openssl'

class VolunteerMatch
  
  attr_reader :conn

  def initialize
    @conn = connect
  end

  def connect 
    conn = Faraday.new(:url => 'http://www.volunteermatch.org/' ) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def generate_nonce
    rand(10 ** 30).to_s.rjust(30,'0')
  end

  # PasswordDigest = Base64 ( SHA256 ( nonce + creation time + API key) )
  def generate_password_digest(nonce,time,api_key)
    raw_digest = [ nonce, time, api_key ].join("")
    OpenSSL::Digest::Digest.new("sha256").base64digest(raw_digest)
  end

  def get_charity(tags)
    username = "SerKnight"
    api_key = "99e302651dfd547e6d23954aba5afe94"
    created = DateTime.now.rfc3339
    nonce = generate_nonce
    password_digest = generate_password_digest(nonce,created,api_key)

    response = conn.get "api/call?action=searchOpportunities&keywords:#{Array(tags)}" do |request|
      request.headers['Content-Type'] = 'application/json'
      request.headers['Authorization'] = %{WSSE profile="UsernameToken"}
      request.headers['X-WSSE'] = %{UsernameToken Username="#{username}", PasswordDigest="#{password_digest}", Nonce="#{nonce}", Created="#{created}"}
    end
    puts response.body
  end

# getting a 401 error now

  def hello_world
    username = "SerKnight"
    api_key = "99e302651dfd547e6d23954aba5afe94"
    created = DateTime.now.rfc3339
    nonce = generate_nonce
    password_digest = generate_password_digest(nonce,created,api_key)

    response = conn.get "api/call?action=helloWorld", { query: { name: "Chris" }.to_json } do |request|
      request.headers['Content-Type'] = 'application/json'
      request.headers['Authorization'] = %{WSSE profile="UsernameToken"}
      request.headers['X-WSSE'] = %{UsernameToken Username="#{username}", PasswordDigest="#{password_digest}", Nonce="#{nonce}", Created="#{created}"}
    end
    puts response.body
  end

end
