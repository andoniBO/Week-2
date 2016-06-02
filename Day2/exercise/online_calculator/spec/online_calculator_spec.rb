require File.expand_path '../spec_helper.rb', __FILE__

describe 'Online calculator app ' do 
	it 'should load the addition section' do
		get '/add'
		expect(last_response.body).to include("Add")
	end
	
#	it 'should add correctly two integers' do	
#		a = rand(100)
#		b = rand(100)
#		expect(last_response.body).to include(a+b)
#	end
end