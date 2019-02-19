class AddCepToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :cep, :integer
  end
end
