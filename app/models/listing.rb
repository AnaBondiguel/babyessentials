class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_rich_text :description
  has_one_attached :picture

  enum condition: {
    very_used_condition: 1,
    good_used_condition: 2,
    used_once: 3,
    brand_new: 4
  }
end
