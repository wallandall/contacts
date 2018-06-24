class GroupsController < ApplicationController
  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      render json: @group, status: :created
    else
      render json: @group.errors.full_messages, status: :unprocessable_entity
    end
   end

   private

   def group_params
    params.require(:group).permit(:name)
   end
end
