class AddOwnerLikeToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :owner_like, :boolean, default: false
  end
end
