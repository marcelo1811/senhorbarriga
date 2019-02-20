class Home < ApplicationRecord
  belongs_to :owner, class_name: :User, foreign_key: :owner_id
  has_many :listing, dependent: :destroy

  validates :address, presence: true
  validates :cep, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :city, presence: true
  validates :price, presence: true
end
