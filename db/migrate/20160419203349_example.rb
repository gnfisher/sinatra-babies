class Example < ActiveRecord::Migration
  def change
    create_table :examle do |t|
      t.string :name
    end
  end
end
