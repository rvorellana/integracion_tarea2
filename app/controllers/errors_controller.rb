class ErrorsController < ApplicationController
  def index
    render json: "", status: :method_not_allowed
  end
end
