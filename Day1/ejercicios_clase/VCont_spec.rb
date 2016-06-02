require_relative 'VCont.rb'

RSpec.describe VowelCalculator do

	let(:vowelCalc){ VowelCalculator }

	it "returns vowel count when input is any word" do
		random = rand(100)
		random_char = rand(100)
		word = []
		(1..random).each {|i| word.push("a")}
		(1..random_char).each {|i| word.push("b")}
		expect(vowelCalc.new(word.join).count).to eq(random)
	end

	it "returns 4 if input is acetato" do
		expect(vowelCalc.new("acetato").count).to eq(4) 
	end

	context "working with nils" do

		let(:vowelCalc){ VowelCalculator.new(nil) }

		it "should not raise error" do
			expect(vowelCalc.count).to eq(1)
		end
	end

	context "working with arrays" do
		let(:vowelCalc){ VowelCalculator}

		it "should not raise error" do
			expect(vowelCalc.new(["c","o","c","o","d","r","i","l","o"]).count).to eq(4)
		end	
	end
end

