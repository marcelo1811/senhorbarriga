class AddTitleToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :title, :string
  end
end
