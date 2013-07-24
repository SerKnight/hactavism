require 'spec_helper'

describe "upvoting videos" do 
  before(:each) do 
    @video = Link.create(content: "http://www.youtube.com/watch?v=ir_Bz2PGvu8", tags: "one, two, three", description: "Hello description", title: "video title")
  end

  context "when clicking the upvtoe button" do 

    xit "adds one point to the video's total" do 
  
    end

  end
end
