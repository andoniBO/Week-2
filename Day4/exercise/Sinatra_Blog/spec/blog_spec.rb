require File.expand_path '../spec_helper.rb', __FILE__
require 'pry'

describe 'Blog class' do
  let(:blog){ Blog.new }
  let(:post){ Post.new("a", "a", Date.new(Time.new.year.to_i, Time.new.month.to_i, Time.new.day.to_i)) }
  let(:laterpost){ Post.new("b", "b", Date.new(Time.new.year.to_i, Time.new.month.to_i, Time.new.day.to_i)) }

  describe 'posts method' do
    it 'returns an array of posts' do
      blog.add_post(post)
      expect(blog.posts[blog.posts.size-1]).to eq(post)
    end
  end

  describe 'latest posts method' do
    it'returns latest posts' do
      blog.add_post(post)
      blog.add_post(laterpost)
      existent_blog = blog.latest_posts
      expect(existent_blog[blog.posts.size-1]).to eq(laterpost)
    end
  end
end
