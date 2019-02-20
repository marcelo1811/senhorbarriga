class RemoveLikeFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :like, :boolean
  end
end
