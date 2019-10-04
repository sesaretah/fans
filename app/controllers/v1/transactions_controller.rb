class V1::TransactionsController < ApplicationController
  def in
    @transactions = Transaction.all.joins(:post).where("posts.user_id = ?", current_user.id)
    render json: { data: ActiveModel::SerializableResource.new(@transactions,  each_serializer: TransactionSerializer ).as_json, klass: 'Profile' }, status: :ok
  end

  def out
    @transactions = Transaction.where(sender_id: current_user.id)
    render json: { data: ActiveModel::SerializableResource.new(@transactions,  each_serializer: TransactionSerializer ).as_json, klass: 'Profile' }, status: :ok
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: { data: @transaction, klass: 'Transaction' }, status: :ok
    end
  end

  def transaction_params
    params.require(:transaction).permit!
  end
end
