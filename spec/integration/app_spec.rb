require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
    include Rack::Test::Methods

    let(:app) { Application.new }

    context 'GET /hello' do
        it 'should return "Hello Leo"' do
            response = get('/hello?name=Leo')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Hello Leo')
        end

        it 'should return "Hello Josh"' do
            response = get('/hello?name=Josh')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Hello Josh')
        end
    end

    context 'POST /sort-names' do
        it 'should return names sorted in alphbetical order' do
            response = post('/sort-names', names: 'Joe,Alice,Zoe,Julia,Kieran')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')         
        end
    end
end