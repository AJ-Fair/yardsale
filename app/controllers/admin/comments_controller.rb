class Admin::CommentsController < ApplicationController

  before_action :authenticate_user!, :authorize_user

  def destroy
    comment = Comment.find(params[:id])
    @user = comment.user
    comment.delete
    render "/admin/users/show"
  end

  private

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to items_path
    end
  end
end
