FactoryBot.define do
  factory :olympian do
    name { "Charter" }
		sex { "M" }
		age { 25 }
		height { 160 }
		weight { 70 }
		team { "USA" }
		games { "2016 Summer" }
		sport { "Bowling" }
		event { "Bowling 2000" }
		medal { "Bronze" }
  end
end
