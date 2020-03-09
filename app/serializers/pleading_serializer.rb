class PleadingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :amount, :profile
  belongs_to :user
  
  def profile
    object.user.profile
  end
end
