class Home < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  belongs_to :owner, class_name: :User, foreign_key: :owner_id
  has_many :listing, dependent: :destroy

  validates :address, presence: true
  validates :cep, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :city, presence: true
  validates :price, presence: true

end
