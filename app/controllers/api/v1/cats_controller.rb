module Api
module V1
  class CatsController < ApplicationController
    def index
      @cats = Cat.all
      json_response(@cats)
    end

    def create
      @cat = Cat.new(cat_params)
      if @cat.save
        json_response(@cat, :created)
      else
        @errors = @cat.errors.full_messages.join(';')
        json_response(@errors)
      end
    end

    private

    def cat_params
      params.permit(:name)
    end
  end
end
end
