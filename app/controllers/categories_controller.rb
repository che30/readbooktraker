class CategoriesController < ApplicationController
  skip_before_action :authorize_request, only: :index
  def index
    @categories = Categorie.all
    json_response(@categories)
  end
  def create
    @categorie = Categorie.create!(categories_params)
    json_response(@categorie,:created)
  end
  private
  def categories_params
    params.permit(:name)
  end
end
