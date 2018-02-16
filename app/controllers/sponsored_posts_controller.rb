class SponsoredPostsController < ApplicationController
  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    
    @sponsored_post = SponsoredPost.new
  end
  
  def create
    @sponsored_post = SponsoredPost.new
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
    
    @topic = Topic.find(params[:topic_id])
    
    @sponsored_post.topic = @topic
    
    if @sponsored_post.save
      redirect_to [@topic, @sponsored_post], notice: "Sponsored post was saved succesfully."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end
  
  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
    
    if @sponsored_post.save
      redirect_to [@sponsored_post.topic, @sponsored_post], notice: "Sponsored post was updated succesfully."
    else
      flash.now[:alert] = "Error updating post. Please try again."
      render :edit
    end
  end

  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end
  
  def destroy
    @sponsored_post = SponsoredPost.find(params[:id])
    
    if @sponsored_post.destroy
      redirect_to @sponsored_post.topic, notice: "\"#{@sponsored_post.title}\" was deleted succesfully."
    else
      flash.now[:alert] = "Error deleting post. Please try again."
      render :show
    end
  end
end
