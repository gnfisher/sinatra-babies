class CreateEventdescriptions < ActiveRecord::Migration
  def change
    create_table :event_descriptions do |t|
      t.string :text
    end
  end
end
