require './spec/spec_helper'
require 'rspec'
require 'rack/test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

describe "Visiting sinatra routes" do
  def app
    Sinatra::Application
  end

  it "/ should return html content" do
    get '/'
    expect(last_response).to be_ok
  end

  it "/whatever should return URL not found" do
    get '/whatever'
    expect(last_response.status).to eq 404
    last_response.body.should include('"error":"URL not found"')
  end

  it "/logs should return json with time value" do
    get '/logs'
    expect(last_response.status).to eq 200
    last_response.body.should include("\"time\"")
  end

  it "/most_active should return json with value" do
    get '/most_active'
    expect(last_response.status).to eq 200
    last_response.body.should include("\"value\"")
  end

end

