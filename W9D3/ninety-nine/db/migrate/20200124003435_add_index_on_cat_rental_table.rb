class AddIndexOnCatRentalTable < ActiveRecord::Migration[5.2]
  def change
    add_index :cat_rental_requests, :cat_id
  end
end
