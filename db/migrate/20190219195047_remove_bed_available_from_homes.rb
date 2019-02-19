class RemoveBedAvailableFromHomes < ActiveRecord::Migration[5.2]
  def change
    remove_column :homes, :bed_available, :integer
  end
end
