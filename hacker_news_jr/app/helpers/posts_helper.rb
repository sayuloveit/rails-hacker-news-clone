module PostsHelper

  def extlink(link)
    link.insert(0, "http://") unless link.include?("http://")
    link
  end

end
