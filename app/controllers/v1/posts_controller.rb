class V1::PostsController < ApplicationController
  #before_action :authenticate_user!, only: [:create]
  def index
    posts = Post.all
    render json: { data: posts, klass: 'Post', user: current_user.id  }, status: :ok
  end

  def show
      @post = Post.find(params[:id])
      render json: { data:  PostSerializer.new(@post).as_json}, status: :ok
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  #  @post.photo.attach(params[:photo])
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
