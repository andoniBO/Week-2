class Blog
	def initialize
		@container = Array.new
		@actual_page = 0
		@front_page = Array.new
	end

	def add_post(post)
		@container.push(post)
	end

	def publish_front_page
		@total_pages = @container.length / 3 + 1
		@container.sort {|item, item2| item2.date <=> item.date}
		@front_page = @container.slice(@actual_page * 3, 3)
		@front_page.each {|item|	print_post(item)}
		(1..@total_pages).each do |item|
			if(item == @actual_page + 1)
				print " #{item} "
			else
				print " #{item} "
			end
		end
		puts ""
		print ">"
		expect_input
	end

	def expect_input
		@input = gets.chomp
		if(@input == 'previous')
			if(@actual_page + 1 > 1)
				@actual_page -= 1
			end
		elsif (@input == 'next')
			if(@actual_page + 1 < @total_pages)
				@actual_page += 1
			end
		else
			puts 'wrong input, try again'
		end
		publish_front_page
	end

	def print_post(item)
		if !item.is_sponsored
			puts "#{item.title}"
			puts '***************'
			puts "#{item.text}"
			puts '---------------'
		else
			puts "******#{item.title}******"
			puts "***************"
			puts "#{item.text}"
			puts "---------------"
		end
	end
end