require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        name: "Name",
        address: "Address",
        contact: "Contact",
        account: "Account",
        account_digit: 2,
        account_type: "Account Type",
        bank: "Bank"
      ),
      Supplier.create!(
        name: "Name",
        address: "Address",
        contact: "Contact",
        account: "Account",
        account_digit: 2,
        account_type: "Account Type",
        bank: "Bank"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Contact".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Account".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Account Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Bank".to_s), count: 2
  end
end
