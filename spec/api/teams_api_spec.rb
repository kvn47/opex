require 'rails_helper'

RSpec.describe "Teams API" do

  describe "POST /api/teams" do
    let(:logo_file) { fixture_file_upload(Rails.root.join('tmp/logo.png')) }
    let(:params) { {team: {name: 'Team 1', location: 'location', logo: logo_file}} }

    before do
      post '/api/teams', headers: headers, params: params
    end

    include_examples "successful request"

    it 'returns created team' do
      team = Team.last
      expect(response.body).to include_json(name: team.name)
    end
  end

  describe "GET /api/teams/:id" do
    it 'returns team' do
      team = Team.create!(name: 'team', location: 'location')
      get "/api/teams/#{team.id}", headers: headers
      expect(response.body).to include_json(name: team.name)
    end
  end

  describe "GET /api/teams" do
    it 'returns teams list' do
      team1 = Team.create!(name: 'team 1', location: 'location')
      team2 = Team.create!(name: 'team 2', location: 'location')
      get '/api/teams', headers: headers
      expect(response.body).to include_json([{name: team1.name}, {name: team2.name}])
    end
  end

  describe "PUT /api/teams/:id" do
    let(:team) { Team.create!(name: 'Team 1', location: 'location') }
    let(:new_name) { 'Team 2' }
    let(:params) { {team: {name: new_name}} }

    before do
      put "/api/teams/#{team.id}", headers: headers, params: params.to_json
    end

    include_examples "successful request"

    it 'updates team' do
      expect(response.body).to include_json(name: new_name)
    end
  end
end
