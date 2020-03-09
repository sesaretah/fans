class V1::PleadingsController < ApplicationController

  def index
    @pleadings = Pleading.all
    render json: { data: ActiveModel::SerializableResource.new(@pleadings,  each_serializer: PleadingSerializer ).as_json, klass: 'Pleading' }, status: :ok
  end 

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
      @pleading.destroy
      render json: { data: ActiveModel::SerializableResource.new(Pleading.all,  each_serializer: PleadingSerializer ).as_json, klass: 'Pleading' }, status: :ok       
    else
      render json: { data: 'Pleading Does Not exist!', klass: 'Pleading' }, status: :ok
    end
  end

  def reject
    @pleading = Pleading.find(params[:id])
    if @pleading && @pleading.destroy
      render json: { data: ActiveModel::SerializableResource.new(Pleading.all,  each_serializer: PleadingSerializer ).as_json, klass: 'Pleading' }, status: :ok    
    end
  end

  def pleading_params
    params.require(:pleading).permit!
  end
end
