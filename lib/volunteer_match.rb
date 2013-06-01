class VolunteerMatch
  include HTTParty
  
  base_uri 'http://www.volunteermatch.org/'

  def self.getVolunteers(uid)
    return get('/api/call'), :query => {
      :method =>
    }

  end


end


Account Name: SerKnight
Account Key: 99e302651dfd547e6d23954aba5afe94

GET /api/call?action=helloWorld&query=... HTTP/1.1
Host: www.volunteermatch.org
Accept-Charset: UTF-8
Content-Type: application/json
Authorization: WSSE profile="UsernameToken"
VolunteerMatch Public-Use API User Manual, 11/09/2010 Page 3