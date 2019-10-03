require "will_paginate/array"

class PostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
                 .paginate(page: params[:page], per_page: 4)
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to @post
    else
      flash.now[:danger] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      flash.now[:danger] = @post.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    flash[:info] = "Post deleted"
    redirect_to posts_url
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
