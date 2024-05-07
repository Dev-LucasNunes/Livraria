class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :photo

  validates :isbn, isbn_format: true
end
