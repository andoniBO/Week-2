class Post
	attr_reader :title, :date, :text, :new_id
	def initialize(new_title, new_text, new_id, new_date = Date.new(Time.new.year.to_i, Time.new.month.to_i, Time.new.day.to_i))
		@id = new_id
		@title = new_title
		@date = new_date
		@text = new_text
	end
end