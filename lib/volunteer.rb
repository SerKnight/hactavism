class Volunteer

	attr_reader :organization_name, :url, :volunteer_title

	def initialize(opp)
		@organization_name = opp["sponsoringOrganizationName"]
		@volunteer_title = opp["title"]
		@url = opp["xml_url"]
	end

	def self.opportunities(tags)
		response = Faraday.get "http://www.allforgood.org/api/volopps?key=#{ENV['ALLFORGOODAPIKEY']}&q=#{tags}&num=3&output=json"
		body = JSON.parse(response.body)
		items = body["items"]
		vol_ops = items[0..2]
		vol_ops.collect{|op| Volunteer.new(op)}
	end
end