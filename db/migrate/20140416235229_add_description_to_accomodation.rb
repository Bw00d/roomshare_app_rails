class AddDescriptionToAccomodation < ActiveRecord::Migration
  def change
    add_column :accomodations, :description, :string
  end
end
