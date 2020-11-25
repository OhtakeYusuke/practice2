class ApplicationController < ActionController::Base
  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticated_user
    @post = Post.find_by(id: params[:id])
    if current_user.id != @post.user.id
      redirect_to root_path, notice: "権限がありません"
    end
  end
end
