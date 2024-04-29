require 'rails_helper'

RSpec.describe "authors/show", type: :view do
  before(:each) do
    assign(:author, Author.create!(
      name: "Name",
      nationality: "Nationality",
      cpf: "Cpf"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Nationality/)
    expect(rendered).to match(/Cpf/)
  end
end
