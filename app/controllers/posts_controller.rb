class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      if !current_user.facebook_token.nil?
        x = FacebookService.new(current_user.facebook_token)
        post_link = post_url(@post)
        x.delay.add_post(@post, post_link) if @post
      end
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
   @post.destroy
   redirect_to root_url
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  private

    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_url if @post.nil?
    end  
end
