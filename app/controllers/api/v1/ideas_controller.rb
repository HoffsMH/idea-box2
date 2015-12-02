class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.all.order(:updated_at)
  end

  def create
    idea = Idea.new(title: idea_params[:title], body: idea_params[:body], tags: {names: idea_params[:tags]})
    if idea.save
      render json: idea.json_hash, status: 200
    else
      render json: {success: false, errors: idea.errors.full_messages.join(", ")}, status: 500
    end
  end

  def destroy
    idea = Idea.find_by(id: id)
    if idea.destroy
      render json: idea.json_hash, status: 200
    else
      render json: {success: false, errors: idea.errors.full_messages.join(", ")}, status: 500
    end
  end
  private
  def idea_params
    params.require(:idea)
  end
  def id
    params.require(:id).to_i
  end


end
