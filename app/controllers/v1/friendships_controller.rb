class V1::FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.user_id = current_user.id
    @friendship.status = 1
    if @friendship.save
      render json: { data: @friendship, klass: 'Friendship' }, status: :ok
    end
  end

  def accept
    @friendship = Friendship.where(friend_id: params[:friend_id], user_id: current_user.id).first
    if !@friendship.blank?
      @friendship.status = 1
      @friendship.save
      render json: { data: @friendship, klass: 'Friendship' }, status: :ok
    else
      render json: { data: 'Friendship Does Not exist!', klass: 'Friendship' }, status: :ok
    end
  end

  def reject
    @friendship = Friendship.where(friend_id: params[:friend_id], user_id: current_user.id).first
    if !@friendship.blank?
      @friendship.status = 2
      @friendship.save
      render json: { data: @friendship, klass: 'Friendship' }, status: :ok
    else
      render json: { data: 'Friendship Does Not exist!', klass: 'Friendship' }, status: :ok
    end
  end

  def destroy
    @friendship = Friendship.where(friend_id: params[:friend_id], user_id: current_user.id).first
    if @friendship && @friendship.destroy
      render json: { data: 'OK', klass: 'Friendship' }, status: :ok
    end
  end

  def friendship_params
    params.require(:friendship).permit!
  end
end
