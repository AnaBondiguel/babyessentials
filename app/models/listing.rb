class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_rich_text :description
  has_one_attached :picture
 
  enum condition: {
    "very used condition": 1,
    "good used condition": 2,
    "used once": 3,
    "brand new": 4
  }
  end
