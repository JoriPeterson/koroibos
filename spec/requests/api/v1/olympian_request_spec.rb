require 'rails_helper'

describe "Olympians API" do
  before :each do
    @athlete_1 = create(:athlete, name: "John", team: "USA", age: 25, sport: "basketball", total_medals_won: 0)
    @athlete_2 = create(:athlete, name: "Sarah", team: "USA", age: 25, sport: "volleyball", total_medals_won: 1)
    @athlete_3 = create(:athlete, name: "George", team: "France", age: 21, sport: "running", total_medals_won: 2)
    @athlete_4 = create(:athlete, name: "Pierre", team: "France", age: 28, sport: "curling", total_medals_won: 3)
  end

  it "sends a list of all olympians" do

    get '/api/v1/olympians'

		olympians = JSON.parse(response.body)['data']

		expect(response).to be_successful
		expect(olympians.count).to eq(4)
    expect(olympians[0]['attributes']['name']).to eq("John")
  end

  it "gets the youngest olympian" do

    get '/api/v1/olympians?age=youngest'

    youngest = JSON.parse(response.body)['data']

    expect(response).to be_successful
    expect(youngest['attributes']['name']).to eq("George")
    expect(youngest['attributes']['age']).to eq(21)
  end

  it "gets the oldest olympian" do

    get '/api/v1/olympians?age=oldest'

    oldest = JSON.parse(response.body)['data']

    expect(response).to be_successful
    expect(oldest['attributes']['name']).to eq("Pierre")
    expect(oldest['attributes']['age']).to eq(28)
  end
end