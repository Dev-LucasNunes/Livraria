class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: { message: "Nome é obrigatório" }
  validates :nationality, presence: { message: "Nacionalidade é obrigatório" }
  validates :date_of_birth, presence: { message: "Data de nascimento é obrigatória" }
  validates :cpf, presence: { message: "Cpf é obrigatório" }

  validate :cpf_formato_e_validade

  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name,
                  using: {
                    tsearch: { prefix: true },
                    trigram: {threshold: 0.1}
                  }

  private

  def cpf_formato_e_validade
    return unless cpf.present?

    unless CPF.valid?(cpf)
      errors.add(:cpf, "Cpf não é válido")
    end

    unless cpf.length == 11
      errors.add(:cpf, "Cpf deve ter 11 dígitos")
    end

    unless cpf =~ /\A\d+\z/
      errors.add(:cpf, "Cpf deve conter somente números")
    end
  end
end
