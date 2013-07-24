class Volunteer

	attr_reader :organization_name, :url

	def initialize(opp)
		@organization_name = opp["sponsoringOrganizationName"]
		@url = opp["xml_url"]
	end

	def self.opportunities(tags)
		response = Faraday.get "http://www.allforgood.org/api/volopps?key=hacktiv13&q=#{tags}&num=3&output=json"
		body = JSON.parse(response.body)
		items = body["items"]
		vol_ops = items[0..2]
		vol_ops.collect{|op| Volunteer.new(op)}
	end
end