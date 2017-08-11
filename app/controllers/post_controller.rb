class PostController < ApplicationController

	# HOME

	get '/' do

	end

	# CREATE ACTIONS
	get '/posts/new' do
		erb :new
	end

	post '/posts' do
		@post = Post.create(params)
		redirect '/posts'
	end

	# SHOW POSTS

	get '/posts/:id' do
		@post = Post.find(params[:id]) 
		erb :show
	end

	get '/posts' do
		erb :index
	end

	# UPDATE POSTS

	get '/posts/:id/edit' do
		@post = Post.find(params[:id])
		erb :edit
	end

	patch '/posts/:id' do
		@post = Post.find(params[:id])
		@post.name = params[:name]
		@post.content = params[:content]
		@post.save

		redirect "/posts/#{@post.id}"
	end

	delete '/posts/:id/delete' do		
		@post = Post.find(params[:id])
		@post.delete

		erb :delete
	end
end