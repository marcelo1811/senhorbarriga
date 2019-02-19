class AddCityToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :city, :string
  end
end
