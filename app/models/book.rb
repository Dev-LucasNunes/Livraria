class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :photo

  validates :title, presence: { message: "Título é obrigatório" }
  validates :isbn, isbn_format: true
end
