require 'spec_helper'

describe Link do 
  context "adding points to links" do 
    let(:video) {Link.create(content: "http://www.youtube.com/watch?v=ir_Bz2PGvu8", tags: "one, two, three", description: "Hello description", title: "video title")}

    it "increases points by 1" do
      expect(video.points).to eq 0
      video.upvote
      expect(video.points).to eq 1
    end

    it "decreases points by 1" do 
      expect(video.points).to eq 0
      video.downvote
      expect(video.points).to eq -1
    end

    it "calculates the score of all vids" do 
      10.times do
        video.upvote
      end
      expect(video.calculate_score.round(2)).to eq 2.58
    end
  end
end