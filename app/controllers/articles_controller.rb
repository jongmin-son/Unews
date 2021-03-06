class ArticlesController < ApplicationController
  include ApplicationHelper
  def show
    puts session.inspect
    @article = Article.find_by_id(params[:id])
    @comments=Comment.find_all_by_article_id(params[:id])

    if not session["article_"+params[:id]]
      puts 'testing'
      session["article_"+params[:id]]="read"
      @article.read_count = @article.read_count+1
      @article.save
    else
      puts 'read before'
    end
    respond_to do |format|
      format.html 
      format.json { render :json => @article }
    end
  end
  
  def vote_right
    if session["article_"+params[:id]] != "checked"
      session["article_"+params[:id]]="checked"
      puts session["article_"+params[:id]]
      @article = Article.find_by_id(params[:id])
      @article.real=@article.real+1
      @article.save
    else
      puts 'already checked in'
    end
    puts session.inspect
    respond_to do |format|
      format.json {}
    end
  end

  def vote_wrong
    if not session['article_'+params[:id]]=='checked'
      session['article_'+params[:id]]='checked'
      @article = Article.find_by_id(params[:id])
      @article.fake++
      @article.save
    end
    respond_to do |format|
      format.json {}
    end
  end

  def index
    @article = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    puts @article.errors.full_messages 
    redirect_to :action=>:main, :controller=>:main    
  end
end
