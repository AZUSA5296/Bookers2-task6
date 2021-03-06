class RelationshipsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    Relationship.create(create_params)
    redirect_back fallback_location: root_path
  end

  def destroy
    relationship =  Relationship.find(params[:id])
    relationship.destroy
    redirect_back fallback_location: root_path
  end

  private

  def create_params
    params.permit(:followed_id).merge(follower_id: current_user.id)
  end

end
