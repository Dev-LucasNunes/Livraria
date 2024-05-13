class Supplier < ApplicationRecord
  has_one :account, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name,
                  using: {
                    tsearch: { prefix: true } # Habilita pesquisa parcial
                  }
end
