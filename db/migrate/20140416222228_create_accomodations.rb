class CreateAccomodations < ActiveRecord::Migration
  def change
    create_table :accomodations do |t|
      t.integer :owner_id
      t.string :room_type
      t.string :location
      t.string :number_of_beds
      t.float :price

      t.timestamps
    end
  end
end
