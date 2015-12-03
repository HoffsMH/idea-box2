class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.all.order(:created_at)
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

  def update
    idea =  proc { Idea.find_by(id: id) }
    if idea.call.change_rating(up_or_down) ||  idea.call.update(title: title) || idea.call.update(body: body)
      render json: idea.call.json_hash, status: 200
    else
      render json: idea.call.json_hash, status: 500
    end

  end

  private
  def idea_params
    params.require(:idea)
  end

  def id
    params.require(:id).to_i
  end

  def up_or_down
    params[:direction]
  end

  def title
    params[:title]
  end

  def body
    params[:body]
  end
end
