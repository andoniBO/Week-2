require File.expand_path '../spec_helper', __FILE__

RSpec.describe PasswordChecker do

	#let(){  }

	it "if password has less than 7 chars" do
		expect(PasswordChecker.new.check_seven("3e4r")).to eq(false)
	end

	it "if password has less than 7 chars" do
		expect(PasswordChecker.new.check_seven("3e4rdqwddw")).to eq(true)
	end

	it "if password has a upper and lower case letter" do
		expect(PasswordChecker.new.check_upper_lower("!2qwerqwe")).to eq(false)
	end

	it "if password has a upper and lower case letter" do
		expect(PasswordChecker.new.check_upper_lower("!2qwerqWE")).to eq(true)
	end

	it "if password contains a letter, number, and symbol" do
		expect(PasswordChecker.new.check_character_number_symbol("QWefdgdfd")).to eq(false)
	end

	it "if password contains a letter, number, and symbol" do
		expect(PasswordChecker.new.check_character_number_symbol("QWe!fdg?¿234dfd")).to eq(true)
	end

	it "if password doesnt contain part of the email or domain" do
		expect(PasswordChecker.new.check_no_mail("hola@email.com", "emailQW1!")).to eq(false)
	end

	it "if password doesnt contain part of the email or domain" do
		expect(PasswordChecker.new.check_no_mail("hola@email.com", "qfsdgerg123D!")).to eq(true)
	end

	it "if password is correct" do
		expect(PasswordChecker.new.check_password("hola@email.com", "!#Q2w3e4r")).to eq(true)
	end

	it "if password has less than 7 chars" do
		expect(PasswordChecker.new.check_password("hola@email.com", "3e4r")).to eq(false)
	end

	it "if password contains a letter, number, and symbol" do
		expect(PasswordChecker.new.check_password("hola@email.com", "QWefdgdfd")).to eq(false)
	end

	it "if password has a upper and lower case letter" do
		expect(PasswordChecker.new.check_password("hola@email.com", "!2qwerqwe")).to eq(false)
	end

	it "if password doesnt contain part of the email or domain" do
		expect(PasswordChecker.new.check_password("hola@email.com", "emailQW1!")).to eq(false)
	end
end

