migration 3, :create_entries do
  up do
    create_table :entries do
      column :id, Integer, :serial => true
      column :weight, DataMapper::Property::Integer
      column :date, DataMapper::Property::Text
      column :lift_id, DataMapper::Property::Integer
      column :user_id, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :entries
  end
end
