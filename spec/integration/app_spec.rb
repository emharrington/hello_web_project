require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
    include Rack::Test::Methods

    let(:app) { Application.new }

    context 'GET /hello' do
        it 'should return "Hello!"' do
            response = get('/hello')

            expect(response.body).to include('<h1>Hello!</h1>')
        end
    end
end