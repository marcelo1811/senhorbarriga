class AddStudentLikeToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :student_like, :boolean, default:true
  end
end
