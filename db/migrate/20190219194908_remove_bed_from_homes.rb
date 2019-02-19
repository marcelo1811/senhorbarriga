class RemoveBedFromHomes < ActiveRecord::Migration[5.2]
  def change
    remove_column :homes, :bed, :integer
  end
end
