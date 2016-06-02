class PasswordChecker
	def check_password(email,password)
		check_seven(password) && check_character_number_symbol(password) && check_upper_lower(password) && check_no_mail(email,password)
	end

	def check_seven(password)
		password.length > 7
	end

	def check_character_number_symbol(password)
		password.match(/[a-zA-Z]/) != nil && password.match(/\d/) != nil && password.match(/[!?¿¡@#]/) != nil
	end

	def check_upper_lower(password)
		password.match(/[a-z]/) != nil && password.match(/[A-Z]/) != nil 
	end

	def check_no_mail(email,password)
		clean_email = email.split(".")
		definitive_email = clean_email[0].split("@")
		#binding.pry
		password.match(definitive_email[0]) == nil && password.match(definitive_email[1]) == nil 
	end
end