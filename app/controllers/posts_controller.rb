require "will_paginate/array"

class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit; end

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
    if @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      flash.now[:danger] = @post.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:info] = "Post deleted"
    redirect_to posts_url
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
