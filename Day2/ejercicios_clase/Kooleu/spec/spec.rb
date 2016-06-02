require File.expand_path '../spec_helper.rb', __FILE__

describe 'The Kooleu App' do 
	it "says hello" do	
		time_ago = (Time.now - (7 * 60 * 60)).to_s
		get'hours/ago/7'
		expect(last_response.body).to include(time_ago)
	end

	it "checks if you are old enough" do 
		get '/puertas/marta/1998'
		expect(last_response.body).to include("Bien")
	end

	it "checks if you are too young" do
		get '/puertas/radomir/2000'
		expect(last_response.body).to include("Thumb-bad")
	end

	it "checks if name is correct" do 
		random_name = "lala" + rand(5).to_s
		get "/puertas/#{random_name}/2000"
		expect(last_response.body).to include(random_name)
	end
end