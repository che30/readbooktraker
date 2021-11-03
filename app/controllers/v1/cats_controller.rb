module V1
  class CatsController < ApplicationController
    def index
      @cats = Cat.all
      json_response(@cats)
    end
    def create
      @cat = Cat.create!(cat_params)
      json_response(@cat)
    end
  private
  def cat_params
    params.permit(:name)
  end
  end
  
end