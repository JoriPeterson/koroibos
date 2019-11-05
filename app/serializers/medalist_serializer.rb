class MedalistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :event, :name, :team, :age, :medal

end
