class TransactionSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :sender_profile,  serializer: ProfileSerializer
  belongs_to :post, serializer: PostSerializer
end
