class V1::PostsController < ApplicationController

  def index
    @friend_ids = Friendship.friend_ids(current_user)
    posts = Post.where('user_id IN (?)', @friend_ids).order('created_at desc')
    render json: { data: ActiveModel::SerializableResource.new(posts,  each_serializer: PostSerializer ).as_json, klass: 'Post' }, status: :ok
  end


  def show
      @post = Post.find(params[:id])
      render json: { data:  PostSerializer.new(@post).as_json}, status: :ok
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render json: { data: @post, klass: 'Post' }, status: :ok
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render json: { data: 'OK'}, status: :ok
    end
  end

  def post_params
    params.require(:post).permit!
  end
end
