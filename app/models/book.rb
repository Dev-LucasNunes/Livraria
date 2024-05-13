class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :photo

  validates :title, presence: { message: "Título é obrigatório" }
  validates :isbn, isbn_format: true

  include PgSearch::Model
  pg_search_scope :search_by_title, against: :title,
                  using: {
                    tsearch: { prefix: true } # Habilita pesquisa parcial
                  }
end

