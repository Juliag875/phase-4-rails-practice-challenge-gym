class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def show
    render json: Client.find(params[:id]) 
  end

  private

  def not_found(exception)
    render json: {errors: exception.message}, status: :not_found
    # render json: {error: "Client not found"}, status: :not_found
  end
end
