class SearchController < ApplicationController
  def search
    query = params[:query]
    @books = Book.search_by_title(query)
    @authors = Author.search_by_name(query)
    @suppliers = Supplier.search_by_name(query)
  end
end
