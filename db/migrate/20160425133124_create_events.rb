class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :baby_id
      t.integer :event_type_id
      t.integer :event_description_id
      t.datetime :time
      
      t.timestamps
    end
  end
end
