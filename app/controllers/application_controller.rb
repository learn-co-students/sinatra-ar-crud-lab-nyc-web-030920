
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  #Create action
  get '/articles/new' do 
    
    erb :new 
  end

  post '/articles' do 
    @article = Article.new 
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect to "/articles/#{ @article.id }"
  end

  #Read action
  get '/articles' do 
    @articles = Article.all 
    erb :index
  end

  get '/articles/:id' do 
    id = params[:id]
    @article = Article.find(id)
    erb :show 
  end

  #Update action
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end


  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  #delete action 
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


  
end
