class AddOwnerToHomes < ActiveRecord::Migration[5.2]
  def change
    add_reference :homes, :owner, foreign_key: { to_table: :users }
  end
end
