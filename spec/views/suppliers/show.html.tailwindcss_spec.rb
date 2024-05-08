require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    assign(:supplier, Supplier.create!(
      name: "Name",
      address: "Address",
      contact: "Contact",
      account: "Account",
      account_digit: 2,
      account_type: "Account Type",
      bank: "Bank"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Account/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Account Type/)
    expect(rendered).to match(/Bank/)
  end
end
