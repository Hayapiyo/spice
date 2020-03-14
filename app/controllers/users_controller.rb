class UsersController < ApplicationController
  def edit
    if current_user.profile
      @profile = Profile.find(current_user.profile.id)
    else
      @profile = current_user.build_profile
    end
  end

  def update
    @profile = Profile.new(user_params[:profile_attributes])
    # binding.pry
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @projects = Project.all
    @myprojects = Project.where(contractor_id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, profile_attributes: [:id, :address, :introduction, :image, :phone_number, :user_id])
  end
end
