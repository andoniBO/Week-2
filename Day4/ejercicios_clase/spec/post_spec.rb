require File.expand_path '../spec_helper.rb', __FILE__

describe 'Post class' do
  describe 'initialize method' do
    it 'will initialize title correctly' do
      post = Post.new("Esos", "lalalala")
      expect(post.title).to eq("Esos")
    end
  end
end
