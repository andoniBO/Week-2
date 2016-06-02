require File.expand_path '../spec_helper.rb', __FILE__

describe 'Post class' do
  describe 'initialize method' do
    it 'will initialize title correctly' do
      post = Post.new('Esos', 'lalalala', Date.new(Time.new.year.to_i, Time.new.month.to_i, Time.new.day.to_i))
      expect(post.title).to eq('Esos')
    end

    it 'will initialize text correctly' do
      post = Post.new('Esos', 'lalalala', Date.new(Time.new.year.to_i, Time.new.month.to_i, Time.new.day.to_i))
      expect(post.text).to eq('lalalala')
    end

    it 'will initialize date correctly' do
      post = Post.new('Esos', 'lalalala', Date.new(Time.new.year.to_i, Time.new.month.to_i, Time.new.day.to_i))
      date = Date.new(Time.new.year.to_i, Time.new.month.to_i, Time.new.day.to_i)
      expect(post.date).to eq(date)
    end
  end
end
