class Account < ApplicationRecord
  belongs_to :supplier

  validates :account, presence: true, length: { in: 7..10 }
  validates :account_digit, presence: true
  validate :validate_account_digit
  validates :account_type, presence: true
  validates :bank, presence: true

  def calculate_verify_digit
    number = self.account
    weight = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5]
    sum = 0

    number.to_s.reverse.chars.each_with_index do |value, index|
      sum += value.to_i * weight[index % 12]
    end

    rest = sum % 11
    verify_digit = (rest < 2) ? 0 : (11 - rest)

    verify_digit
  end

  private

  def validate_account_digit
    calculated_digit = calculate_verify_digit
    if self.account_digit != calculated_digit.to_s
      errors.add(:account_digit, "não é válido.")
    end
  end
end
