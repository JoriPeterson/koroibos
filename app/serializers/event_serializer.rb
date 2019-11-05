class EventSerializer
  include FastJsonapi::ObjectSerializer

  attribute :sport do |object|
    object.sport
  end

  attribute :events do |object|
    object.events.pluck(:event)
  end
end
