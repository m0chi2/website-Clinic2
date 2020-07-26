class PostsController < ApplicationController
  def index
    @posts = Post.where(patient_id: current_patient.id).page(params[:page]).reverse_order
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)
    @post.patient_id = current_patient.id
    @post.save
    redirect_to posts_path
  end

  def params_post
    params.require(:post).permit(:bothering_start_id, :bothering_genre_id, :content)
  end
end
