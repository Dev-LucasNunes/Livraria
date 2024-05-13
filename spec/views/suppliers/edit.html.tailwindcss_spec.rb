require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  let(:supplier) {
    Supplier.create!(
      name: "MyString",
      address: "MyString",
      contact: "MyString",
      account: "MyString",
      account_digit: 1,
      account_type: "MyString",
      bank: "MyString"
    )
  }

  before(:each) do
    assign(:supplier, supplier)
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(supplier), "post" do

      assert_select "input[name=?]", "supplier[name]"

      assert_select "input[name=?]", "supplier[address]"

      assert_select "input[name=?]", "supplier[contact]"

      assert_select "input[name=?]", "supplier[account]"

      assert_select "input[name=?]", "supplier[account_digit]"

      assert_select "input[name=?]", "supplier[account_type]"

      assert_select "input[name=?]", "supplier[bank]"
    end
  end
end
