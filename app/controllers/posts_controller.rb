class PostsController < ApplicationController
  before_filter :signed_in_user
  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  	# @user = User.find(params[:user_id])
   #  @post = @user.posts.find(params[:id])
   #  @post.destroy
   #  redirect_to user_path(@user)
  end
end
