require 'spec_helper'

describe "adding a new video to Hacktavism" do 
  context "when I visit the home page" do 
    it "there is a navbar with the options to post & watch videos" do 
      visit "/"
      expect(page).to have_content("Submit Content")
      expect(page).to have_content("Watch Documentaries")
    end

    it "when I post content there is an option to post a new video" do 
      visit "/links/new"
      expect(page).to have_content("Activate a New Video")
    end

    it "has the option to submit a link, tags, and description" do 
      visit "/links/new"
      expect(page).to have_content("Video url")
      expect(page).to have_content("Tags")
      expect(page).to have_content("Description")
    end

    it "validates the presence of content in each field" do 
      visit "/links/new"
      fill_in("link_content", :with => "")
      fill_in("link_tags", :with => "")
      fill_in("description", :with => "")
      click_button("Take Action")
      expect(page).to have_content("You Gotta fill in all form fields to post a video")
    end

    it "validates that there is either a youtube or vimeo url" do 

    end
  end
end

# fill_in('First Name', :with => 'John')