json.extract! book, :id, :title, :author_id, :genre, :publication_date, :created_at, :updated_at
json.url book_url(book, format: :json)
