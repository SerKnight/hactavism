class Link < ActiveRecord::Base

  include ActiveModel::Validations
  validates_with VideoValidator
  validates_presence_of :tags, :length => { :minimum => 3 }
  

  def youtube_embed(youtube_url)
    if youtube_url[/yout\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<iframe title="youTube video player" width="800" height="487.5" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
  end


  def vimeo_embed(vimeo_url)
    vimeo_id = vimeo_url[-8..-1]

    %Q{<iframe id="moog" src="http://player.vimeo.com/video/#{ vimeo_id }" width="800" height="487.5" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>} 
  end


  def embed(url)
    if url.include?("youtube")
      youtube_embed(url)
    elsif url.include?("vimeo")
      vimeo_embed(url)
    end
  end

end
