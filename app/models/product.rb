class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :category_id, presence: true
  validates :name, presence: true,
                   length: {maximum: Settings.model.user.name_length}
end
