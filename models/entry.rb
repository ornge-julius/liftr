class Entry
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :weight, Integer
  property :date, Text
  property :lift_id, Integer
  belongs_to :lift
end
