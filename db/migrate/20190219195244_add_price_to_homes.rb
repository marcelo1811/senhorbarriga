class AddPriceToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :price, :integer
  end
end
