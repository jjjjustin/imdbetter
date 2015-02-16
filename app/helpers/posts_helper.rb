module PostsHelper

  def embed(url)
    youtube_id = url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
end
