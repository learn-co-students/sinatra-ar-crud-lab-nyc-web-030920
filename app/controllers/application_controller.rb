
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    puts "articles"
    puts @articles
    erb :index
  end
  post '/articles' do
    a = Article.create(title: params[:title], content: params[:content])
    redirect to "/articles/#{a.id}"
  end

  get '/articles/new' do
    erb :new
  end
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  patch '/articles/:id' do
    a = Article.find(params[:id])
    if params[:title].size > 0
      a.title = params[:title]
    end 
    if params[:content].size > 0
      a.content = params[:content]
    end
    a.save 
    redirect to "/articles/#{a.id}"
  end
  delete '/articles/:id' do
    a = Article.find(params[:id])
    a.delete
    redirect to "/articles"
  end
end
