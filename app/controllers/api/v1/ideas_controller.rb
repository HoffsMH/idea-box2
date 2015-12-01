class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.first
  end
end
