class PostsController < ApplicationController

	before_filter :load

	def load
		all_posts
		@post = Post.new
	end

	respond_to :js, :html
  def index
		all_posts
		respond_with
  end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		all_posts
		if @post.save
			respond_with
		else
			redirect_to posts_path
		end
	end
		
	def edit
		@post = Post.find(params[:id])
		respond_with
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			all_posts
			respond_with
		else
		end
	end

	def show
		@post = Post.find(params[:id])
		all_posts
		respond_with
	end

	def destroy
		@post = Post.find(params[:id])
		@post.delete
		respond_with
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def all_posts
		@posts = Post.all
	end

end
