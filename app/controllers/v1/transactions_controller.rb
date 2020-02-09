class V1::TransactionsController < ApplicationController
  def in
    @transactions = Transaction.all.joins(:post).where("posts.user_id = ?", current_user.id)
    render json: { data: ActiveModel::SerializableResource.new(@transactions,  each_serializer: TransactionSerializer ).as_json, klass: 'Transaction' }, status: :ok
  end

  def out
    @transactions = Transaction.where(sender_id: current_user.id)
    render json: { data: ActiveModel::SerializableResource.new(@transactions,  each_serializer: TransactionSerializer ).as_json, klass: 'Transaction' }, status: :ok
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.sender.wallet.amount >  0 && @transaction.save
      render json: { data: TransactionSerializer.new(@transaction).as_json, klass: 'Transaction' }, status: :ok
    else
      render json: { data: 'Empty Wallet', klass: 'Transaction' }, status: :ok
    end
  end

  def transaction_params
    params.require(:transaction).permit!
  end
end
