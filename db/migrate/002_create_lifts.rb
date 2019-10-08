migration 2, :create_lifts do
  up do
    create_table :lifts do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String, :length => 255
      column :user_id, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :lifts
  end
end
