require 'rails_helper'

describe "Events Requests" do
  before :each do
    @sport_1 = Sport.create(sport: "Bowling")
    @event_1 = create(:event, event: "Best Shoes", sport_id: @sport_1.id, )
    @event_2 = create(:event, event: "Best Socks", sport_id: @sport_1.id)
    @event_3 = create(:event, event: "Best Granny Shot", sport_id: @sport_1.id)

    @sport_2 = Sport.create(sport: "Swimming")
    @event_4 = create(:event, event: "Best Arm Floaties", sport_id: @sport_2.id)
  end

  it "sends a list of all sports and events for each sport" do

    get '/api/v1/events'

		events = JSON.parse(response.body)['data']

		expect(response).to be_successful
    expect(events[0]['attributes']['sport']).to eq("Bowling")
    expect(events[0]['attributes']['events']).to eq(["Best Shoes", "Best Socks", "Best Granny Shot"])
    expect(events[1]['attributes']['sport']).to eq("Swimming")
    expect(events[1]['attributes']['events']).to eq(["Best Arm Floaties"])
  end

  it "sends a list of all medalist for each event" do

    olympian_1 = create(:olympian, name: "John", team: "USA", age: 25, event: "Basketball", medal: "Gold"  )
    olympian_2 = create(:olympian, name: "Sarah", team: "USA", age: 25, event: "Basketball", medal: "Silver")
    olympian_3 = create(:olympian, name: "George", team: "France", age: 21, event: "Basketball", medal: "Bronze")

    get "/api/v1/events/#{@event_1.id}/medalists"

		events = JSON.parse(response.body)['data']
binding.pry
		expect(response).to be_successful
    expect(events[0]['attributes']['sport']).to eq("Bowling")
  end
end
