require 'rails_helper'

describe "Olympians API" do
  before :each do
    @olympian_1 = create(:olympian, name: "John", team: "USA", age: 25, sport: "basketball", total_medals_won: 0, sex: "M", weight: 70)
    @olympian_2 = create(:olympian, name: "Sarah", team: "USA", age: 25, sport: "volleyball", total_medals_won: 1, sex: "F", weight: 65)
    @olympian_3 = create(:olympian, name: "George", team: "France", age: 21, sport: "running", total_medals_won: 2, sex: "M", weight: 80)
    @olympian_4 = create(:olympian, name: "Pierre", team: "France", age: 28, sport: "curling", total_medals_won: 3, sex: "M", weight: 75)
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

  it "gets olympian stats" do

    get '/api/v1/olympian_stats'

    stats = JSON.parse(response.body)['data']

    expect(response).to be_successful

    expect(stats['attributes']['olympian_stats']['total_competing_olympians']).to eq(4)
    expect(stats['attributes']['olympian_stats'].values.last).to eq(24.8)
  end

  it "can find an olympian by name" do

    get "/api/v1/olympians/find?name=#{@olympian_1.name}"

		olympian = JSON.parse(response.body)['data']

		expect(response).to be_successful
    expect(olympian['attributes']['name']).to eq("John")
  end

  it "can find all olympians by team" do

    get "/api/v1/olympians/find_all?team=USA"

    olympians = JSON.parse(response.body)['data']

		expect(response).to be_successful
    expect(olympians[0]['attributes']['team']).to eq("USA")
    expect(olympians[1]['attributes']['team']).to eq("USA")
  end

  it "it sends error message if attribute doesn't exist" do

    get "/api/v1/olympians/find_all?team=Spain"

    olympians = JSON.parse(response.body)

    expect(olympians).to eq({"error"=>"Attribute does not exist"})
  end

  it "it sends error message if attribute doesn't exist for single olympian" do

    get "/api/v1/olympians/find?team=Spain"

    olympian = JSON.parse(response.body)

    expect(olympian).to eq({"error"=>"Attribute does not exist"})
  end
end
