class Listing < ApplicationRecord
  belongs_to :home
  belongs_to :student, class_name: :User, foreign_key: :student_id
end
