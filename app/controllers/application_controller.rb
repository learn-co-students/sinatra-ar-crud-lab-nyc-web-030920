
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #READ Action
  get '/articles' do 
    @articles = Article.all

    erb :index
  end

  #New Action
  get '/articles/new' do 
    erb :new 
  end

  #Create Action
  post '/articles' do 
    article = Article.create(params)

   redirect to "/articles/#{article.id}"
  end

    #SHOW Action 
    get '/articles/:id' do 
      @article = Article.find(params[:id])
  
      erb :show
    end

  #EDIT Action
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])

    erb :edit 
  end

  #UPDATE Action
  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    # binding.pry
    @article.update(params[:article])

   redirect to "/articles/#{@article.id}"
  end



  #DELETE Action
  delete '/articles/:id' do 
    Article.destroy(params[:id])

    redirect to "/articles"
  end


end
