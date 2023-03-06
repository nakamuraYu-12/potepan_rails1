class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_day, :end_day, :all_day, :memo))
    if @post.save
      flash[:success] = "スケジュールを作成しました"
      redirect_to :posts
    else
      flash[:warning] = "スケジュール作成に失敗しました"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_day, :end_day, :all_day, :memo))
      flash[:success] = "スケジュールを編集しました"
      redirect_to :posts
    else
      flash[:warning] = "スケジュール編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "スケジュールを削除しました"
    redirect_to :posts
  end

end
