class Supplier < ApplicationRecord
  has_one :account, dependent: :destroy
  accepts_nested_attributes_for :account

  validates :name, presence: true
  validates :address, presence: true
  validates :contact, presence: true
  validates :cnpj, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name,
                  using: {
                    tsearch: { prefix: true },
                    trigram: {threshold: 0.1}
                  }

  validate :cnpj_validate

  private

  def cnpj_validate
    return unless cnpj.present?

    unless CNPJ.valid?(cnpj)
      errors.add(:cnpj, " não é válido")
    end

    unless cnpj.length == 14
      errors.add(:cnpj, "deve ter 14 dígitos, somente números")
    end
  end
end
