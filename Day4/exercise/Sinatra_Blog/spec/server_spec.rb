require File.expand_path '../spec_helper.rb', __FILE__

describe 'Sinatra Blog' do
  describe 'index page' do
    it 'gives status 200' do
      get('/')
      expect(last_response).to be_ok
    end
  end
end
