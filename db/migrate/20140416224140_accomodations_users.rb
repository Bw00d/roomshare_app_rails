class AccomodationsUsers < ActiveRecord::Migration
  def change
    create_table :accomodations_users do |t|
      t.integer :accomodation_id
      t.integer :user_id

      t.timestamps
    end
  end
end

