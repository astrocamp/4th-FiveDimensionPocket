class ArticleController < ApplicationController

  def index
    # @articles_json = current_user.articles.to_json
    @articles_solve_nplus1 = Article.with_attached_article_images   #解決 N+1 問題
    @articles = Article.order(id: :desc)
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
        images: response_hash['images']
      })
      # @article.images = response_hash['images']
      @article.save
      #render 之前要先把 input value 清空
      redirect_to article_index_path
    else
      flash[:notice] = '請輸入正確網址'
    end
  end



  private
  def url_params
    params.require(:article).permit(:link, article_images: []) 
  end
end