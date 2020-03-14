class GroupsController < ApplicationController
  def index
    if current_user.groups.any?
      @groups = current_user.groups
      @groups.each do |group|
        @group = group
      end
      @users = @group.users.where.not(id: current_user.id)
    else
      redirect_to root_path
    end
  end

  def create
    # @project = Project.find(params[])
    # binding.pry
    # @project = Project.find(user_id: )
    @group = Group.new(user_ids: [current_user.id, params[:format]])
    if @group.save
      redirect_to groups_path
    else
      render root_path
    end
  end
end