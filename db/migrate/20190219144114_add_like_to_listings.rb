class AddLikeToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :like, :boolean, default: false
  end
end
