class Blog
  attr_reader :posts
  def initialize
    @posts = Array.new
  end

  def add_post(post)
    @posts.push(post)
  end

  def latest_posts
    @posts.sort! { |post1, post2| post2.date <=> post1.date }
  end
end