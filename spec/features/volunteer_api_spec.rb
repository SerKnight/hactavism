require "spec_helper"

describe "when querying the all for good API" do 

	let(:link) {Link.create(content: "http://www.youtube.com/watch?v=RkGf1iLERx8", tags: "children, poverty", description: "timor travel video")}

	context "on a video show page" do 
		it "should query the api with the tags" do 
			tags = "children"
			Volunteer.opportunities(tags).count.should eq 3
		end
	end
end