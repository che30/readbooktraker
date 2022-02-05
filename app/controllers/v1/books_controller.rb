module V1
  class BooksController < ApplicationController
    def allbooks
      @books = Book.includes(:measurements)
      json_response(@books)
    end
    def create
      @book = current_user.books.create!(books_params)
      json_response(@book, :created)
    end

    private

    def books_params
      params.permit(:name, :author, :isbn, :number_of_pages, :cat_id,:user_id)
    end
  end
end
