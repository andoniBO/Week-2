class VowelCalculator
	def initialize(word)
		@word = word
	end

	def count
		counter = 0

		case @word
			when @word.kind_of? Array
				chars = ["a"]
			when String
				chars = @word.split("")
			when Array
				chars = @word
		end

		chars.grep(/[aeiou]/){|chr| counter += 1}
		counter
	end
end


#VowelCalculator.new(["c","o","c","o","d","r","i","l","o"]).count