require 'active_model'
require './app/models/video_validator'


describe VideoValidator do 

context "Youtube video validation" do 
  it "recognizes a valid YouTube video" do 
    expect(subject.valid_url?("http://www.youtube.com/watch?v=QSKCZnmh5qg")).to eq true
  end

  it "recognizes an invalid YouTube video" do 
    expect(subject.valid_url?("http://www.youporn.com/watch?v=QSKCZnmh5qg")).to eq false
  end

  it "accepts YouTube videos without http:// or wwww. in the url" do 
    expect(subject.valid_url?("youtube.com/watch?v=QSKCZnmh5qg")).to eq true
  end

  it "declines a YouTube video with less than an 11 charachter video code" do 
    expect(subject.valid_url?("youtube.com/watch?v=QSKCZnmh54")).to eq false
  end
end

context "Vimeo video validation" do 

  it "accepts valid Vimeo video formats" do 
    expect(subject.valid_url?("http://vimeo.com/65099905")).to eq true
  end

  it "recognizes an invalid vimeo video format" do 
    expect(subject.valid_url?("http://vimeocom/65099905")).to eq false
  end

  it "recognizes the length of a video code on the end" do 
    expect(subject.valid_url?("http://www.vimeo.com/1234567")).to eq false
  end

  it "allows videos to be embedded without the http:// or www." do
    expect(subject.valid_url?("vimeo.com/12345678")).to eq true
  end


  it "recognizes bad videos without the http:// or www." do
    expect(subject.valid_url?("vimeo.com/12345678345")).to eq false
  end
end

end