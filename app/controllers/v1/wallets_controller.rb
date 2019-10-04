class V1::WalletsController < ApplicationController
  def charge
    @wallet = Wallet.where(user_id: params[:user_id]).first
    if @wallet.blank?
      @wallet = Wallet.create(user_id: params[:user_id])
    end
    @wallet.amount =  @wallet.amount.to_i + params[:amount].to_i
    @wallet.save
    render json: { data: @wallet, klass: 'Wallet' }, status: :ok
  end
end
