class Post
	attr_reader :title, :date, :text
	def initialize(new_title, new_text)
		@title = new_title
		@date = Time.now
		@text = new_text
	end
end