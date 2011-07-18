class NewsItemsController < ApplicationController
  before_filter :authorize_user_is_admin

  def index
    @news = paginate(NewsItem.all)
  end

  def new
    @news = NewsItem.new
  end

  def create
    @news = NewsItem.new(params[:news])
    @news.save

    redirect_to :action => "news"
  end

  def edit
    @news = NewsItem.find(params[:id])
  end

  def update
    @news = NewsItem.find(params[:id])
    if @news.update_attributes(params[:news])
      flash['notice'] = 'NewsItem was successfully updated.'
      redirect_to :action => 'news'
    else
      render :action => 'edit_news'
    end
  end

  def delete
      NewsItem.find(params[:id]).destroy
      redirect_to :action => 'news'
  end
end
