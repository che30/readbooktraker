module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @categories = Category.all
        json_response(@categories)
      end

      def create
        @category = Category.new(category_params)
        if @category.save
          json_response(@category, :created)
        else
          @errors = @category.errors.full_messages.join(';')
          json_response(@errors)
        end
      end

      private

      def category_params
        params.permit(:name)
      end
    end
  end
end
