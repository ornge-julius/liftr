class Entry
  include DataMapper::Resource
  #TODO: need to verify feilds are correct types
  # property <name>, <type>
  property :id, Serial
  property :weight, Integer
  property :date, Text
  property :lift_id, Integer
  belongs_to :lift
end
