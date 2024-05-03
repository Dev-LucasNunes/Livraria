require 'rails_helper'

RSpec.describe "authors/edit", type: :view do
  let(:author) {
    Author.create!(
      name: "MyString",
      nationality: "MyString",
      cpf: "MyString"
    )
  }

  before(:each) do
    assign(:author, author)
  end

  it "renders the edit author form" do
    render

    assert_select "form[action=?][method=?]", author_path(author), "post" do

      assert_select "input[name=?]", "author[name]"

      assert_select "input[name=?]", "author[nationality]"

      assert_select "input[name=?]", "author[cpf]"
    end
  end
end
