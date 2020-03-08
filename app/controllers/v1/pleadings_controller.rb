class V1::PleadingsController < ApplicationController
  def create
    @pleading = Pleading.new
    @pleading.user_id = current_user.id
    @pleading.amount = params[:amount]
    if @pleading.save
      render json: { data: @pleading, klass: 'Pleading' }, status: :ok
    end
  end

  def accept
    @pleading = Pleading.find(params[:id])
    if !@pleading.blank?
      @pleading.user.wallet.amount += @pleading.amount    
      render json: { data: ProfileSerializer.new(@pleading.user.profile, scope: {user_id: @pleading.user.id}).as_json, klass: 'Profile' }, status: :ok
      @pleading.destroy
    else
      render json: { data: 'Pleading Does Not exist!', klass: 'Pleading' }, status: :ok
    end
  end

  def destroy
    @pleading = Pleading.find(params[:id])
    if @pleading && @pleading.destroy
      render json: { data: 'OK', klass: 'Pleading' }, status: :ok
    end
  end

  def pleading_params
    params.require(:pleading).permit!
  end
end
