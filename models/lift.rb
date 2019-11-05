class Lift
  include DataMapper::Resource
  
  #TODO: Need to verify fields are correct types (i.e. integers or strings)
  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :user_id, Integer
  has n, :entries

  before :destroy, :cascade

  def cascade
  	self.entries.each do |entry|
  		entry.destroy
  	end
  end

end
