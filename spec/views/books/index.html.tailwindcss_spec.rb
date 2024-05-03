require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        title: "Title",
        author: nil,
        genre: "Genre"
      ),
      Book.create!(
        title: "Title",
        author: nil,
        genre: "Genre"
      )
    ])
  end

  it "renders a list of books" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Genre".to_s), count: 2
  end
end
