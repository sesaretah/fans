class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :created_at,:image_url, :blured_image_url, :video_url, :blured_video_url, :thumb_url,:transaction
  belongs_to :profile,  serializer: ProfileSerializer

  def transaction
    if instance_options[:user_id]
      object.transactions.where(sender_id: instance_options[:user_id]).first
    elsif scope[:user_id]
      object.transactions.where(sender_id: scope[:user_id]).first
    end
  end

  def thumb_url
    if object.thumb.attached?
      rails_blob_url(object.thumb, only_path: true)
    end
  end

  def image_url
    if object.image.attached?
      rails_blob_url(object.image, only_path: true)
    end
  end

  def blured_image_url
    if object.blured_image.attached?
      rails_blob_url(object.blured_image, only_path: true)
    end
  end

  def video_url
    if object.video.attached?
      rails_blob_url(object.video, only_path: true)
    end
  end

  def blured_video_url
    if object.blured_video.attached?
      rails_blob_url(object.blured_video, only_path: true)
    end
  end
end
