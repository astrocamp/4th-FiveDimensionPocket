class ArticleController < ApplicationController

  def index
    # @articles_json = current_user.articles.to_json
    @articles = Article.with_attached_article_cover   #解決 N+1 問題
  end

  def create
    response = HTTParty.get("https://extractorapi.com/api/v1/extractor/?apikey=e3e6d4d35cbf7ecc564ed3d42fca87a75cc242dc&url=#{url_params[:link]}")
    response_hash = JSON.parse(response.body)

    if response.code == 200
      @article.assign_attributes({
        user_id: current_user.id,
        link: url_params[:link],
        title: response_hash['title'],
        content: response_hash['text'],
        domain: response_hash['domain'],
      })
      @article.save
      #render 之前要先把 input value 清空
      render :index
    else
      flash[:notice] = '請輸入正確網址'
    end
  end



  private
  def url_params
    params.require(:article).permit(:link, :article_cover) 
  end
end