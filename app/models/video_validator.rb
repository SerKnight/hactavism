class VideoValidator < ActiveModel::Validator

  def validate(record)
    unless valid_url?(record.content)
      record.errors[:content] << "Sorry - Only YouTube or Vimeo URL's are allowed"
    end
  end

  YOUTUBE_REGEXP = /^(?:http:\/\/)?(?:www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]{11})/
  VIMEO_REGEXP = /^(?:http:\/\/)?(?:www\.)?vimeo\.com\/\d{6,8}(?=\b|\/)/  

  def valid_url?(url)
    !!(YOUTUBE_REGEXP =~ url) | !!(VIMEO_REGEXP =~ url)
  end
end
