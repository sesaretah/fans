class V1::ProfilesController < ApplicationController
  def index
    profiles = Profile.all
    render json: { data: profiles, klass: 'Profile'  }, status: :ok
  end

  def show
    @profile = Profile.find(params[:id])
    render json: { data: ProfileSerializer.new(@profile).as_json, klass: 'Profile' }, status: :ok
  end

  def my
    @profile = current_user.profile
    render json: { data: ProfileSerializer.new(@profile).as_json, klass: 'Profile' }, status: :ok
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      render json: { data: @profile, klass: 'Profile' }, status: :ok
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      render json: { data: @profile, klass: 'Profile' }, status: :ok
    end
  end



  def profile_params
    params.require(:profile).permit!
  end
end
