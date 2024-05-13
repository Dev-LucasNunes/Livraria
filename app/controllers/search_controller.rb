class SearchController < ApplicationController
  def search
    @books = Book.search_by_title(params[:query])
    @authors = Author.search_by_name(params[:query])
    @suppliers = Supplier.search_by_name(params[:query])
  end
end