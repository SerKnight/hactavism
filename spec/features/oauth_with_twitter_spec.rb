require 'spec_helper'

describe "when connecting through OAuth with Twitter" do 
	it "adds your twitter account to the header" do 
		visit '/'
		expect(page).to have_content("Online Documentaries to Inspire Action")
		click_link "Twitter Login"
		expect(page).to have_content("Authorize Hacktivism to use your account?")
	end
end
