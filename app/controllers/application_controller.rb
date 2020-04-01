
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  #INDEX action
  get '/articles' do
    @articles = Article.all
    erb :index
  end

#NEW action
  get '/articles/new' do
    erb :new
  end

# CREATE Actions
  post '/articles' do
    article = Article.create(params)
   
    redirect to "/articles/#{article.id}"
   end

#SHOW action
get '/articles/:id' do
  @article = Article.find(params[:id])
  
  erb :show
end

#EDIT action
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

  erb :edit
  end

#DESTROY action
  delete '/articles/:id' do
    @article = Article.delete(params[:id])
    redirect to "/articles"
  end

#UPDATE
  patch '/articles/:id' do
    @article = Article.find(params[:id])

    @article.update(params[:article])
    
    redirect to "/articles/#{@article.id}"
  
  end

end
