class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :home, foreign_key: true
      t.references :student, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
