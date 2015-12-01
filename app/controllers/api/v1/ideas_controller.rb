class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.all.order(:updated_at).reverse
  end
  def create
    idea = Idea.new(title: idea_params[:title], body: idea_params[:body], tags: {names: idea_params[:tags]})
    if idea.save
      render json: {success: true, errors: idea.errors.full_messages}, status: 200
    else
      render json: {success: false, errors: idea.errors.full_messages.join(", ")}, status: 500
    end
  end
  private
  def idea_params
    params.require(:idea)
  end
end
