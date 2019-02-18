class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :address
      t.integer :bed
      t.integer :bed_available

      t.timestamps
    end
  end
end
