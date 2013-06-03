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

  def get_charity(tags)
    response = conn.get "api/call?action=searchOpportunities&keywords:#{tags}.json"
    puts response.body
  end


end


# Account Name: SerKnight
# Account Key: 99e302651dfd547e6d23954aba5afe94

# GET /api/call?action=helloWorld&query=... HTTP/1.1
# Host: www.volunteermatch.org
# Accept-Charset: UTF-8
# Content-Type: application/json
# Authorization: WSSE profile="UsernameToken"
# VolunteerMatch Public-Use API User Manual, 11/09/2010 Page 3