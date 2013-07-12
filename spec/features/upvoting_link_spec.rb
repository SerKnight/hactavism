require 'spec_helper'

describe "upvoting videos" do 
  context "when clicking the upvtoe button" do 
    it "adds one point to the video's total" do 
      visit '/links'
    end
  end
end
