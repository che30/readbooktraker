module V1
  class BooksController < ApplicationController
    def create
      @book = Book.create!(books_params)
      json_response(@book, :created)
    end

    private

    def books_params
      params.permit(:name, :author, :isbn, :number_of_pages, :cat_id)
    end
  end
end
