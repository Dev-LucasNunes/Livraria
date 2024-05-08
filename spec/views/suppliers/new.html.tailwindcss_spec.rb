require 'rails_helper'

RSpec.describe "suppliers/new", type: :view do
  before(:each) do
    assign(:supplier, Supplier.new(
      name: "MyString",
      address: "MyString",
      contact: "MyString",
      account: "MyString",
      account_digit: 1,
      account_type: "MyString",
      bank: "MyString"
    ))
  end

  it "renders new supplier form" do
    render

    assert_select "form[action=?][method=?]", suppliers_path, "post" do

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
