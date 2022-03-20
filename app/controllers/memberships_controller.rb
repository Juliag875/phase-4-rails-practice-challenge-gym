class MembershipsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :not_valid

  def create
    render json: Membership.create!(membership_params)
  #OR
    # gym_id: params[:gym_id],
    # client_id: params[:client_id],
    # charge: params[:charge]
    
   
  #  if membership.valid?
  #    render json: membership, status: :created
  #  else
  #    render json: {error: membership.errors.full_messages}
  # end
 end

 private

 def membership_params
  params.permit(:gym_id, :client_id, :charge)
 end

 def not_valid(exception)
  render json: {errors: exception.message}, status: :unprocessable_entity
  # render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
 end

end
