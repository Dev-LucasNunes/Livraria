class Account < ApplicationRecord
  belongs_to :supplier

  validates :account, presence: true
  validates :account_digit, presence: true
  validates :account_type, presence: true
  validates :bank, presence: true

  validate :validate_account_digit

  def validate_account_digit
    number = self.account
    weight = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5]
    sum = 0

    number.to_s.reverse.chars.each_with_index do |value, index|
      sum += value.to_i * weight[index % 12]
    end

    rest = sum % 11
    account_digit = (rest < 2)? 0 : (11 - rest)

    self.account_digit = account_digit.to_s
  end
end
