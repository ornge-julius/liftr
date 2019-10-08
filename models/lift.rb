class Lift
  include DataMapper::Resource
  
  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :user_id, Integer
  has n, :entries
end
