require 'spec_helper'

describe "adding a new video to Hacktavism" do 
  context "when I visit the home page" do 

    it "when I post content there is an option to post a new video" do 
      visit "/links/new"
      expect(page).to have_content("Activate a New Video")
    end

    it "has the option to submit a link, tags, and description" do 
      visit "/links/new"
      expect(page).to have_content("Video url")
      expect(page).to have_content("Tags")
      expect(page).to have_content("Video description")
    end

    it "validates the presence of content in each field" do 
      visit "/links/new"
      fill_in("link_content", :with => "")
      fill_in("link_tags", :with => "")
      fill_in("link_description", :with => "")
      click_button("Take Action")
      expect(page).to_not have_content("Video about")
    end
  end
end

