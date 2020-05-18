# 題目 Five Dimension Pocket

## 作者: 玲涓、必久、家維

## 亮點功能 
向知名網路文章管理工具 Pocket 致敬！
輸入網址即可儲存文章
* 文章新增標籤
* 加到我的最愛
* 已讀功能
* 成就圖表
* 分享連結至推特、FB、LINE
* Google小姐念給你聽
* 快速搜尋收藏的文章
* 無廣告版文章閱讀頁面


## 使用技術
* Ruby version：2.6.5
* Language: Ruby
* Framework: Ruby On Rails
* Front-End: HTML/CSS/Javascript/jQuery, Webpack, Vue.js, Bootstrap, axios
* Third-Party Serivce: Google API, Facebook API, EXTRACTOR API
* Database: Postgresql
* Gem: Devise, HTTParty, figaro

## 安裝注意事項
### 須將sample副檔名拿掉，並填入對應金鑰及資料庫設定
* FiveDimensionPocket/config/database.yml.sample (資料庫連線設定)
* FiveDimensionPocket/config/application.yml.sample 
  * google_client_id: [第三方登入 Google 金鑰]
  * google_client_secret: [第三方登入 Google 金鑰]
  * facebook_client_id: [第三方登入 Fb 金鑰]
  * facebook_client_secret: [第三方登入 Fb 金鑰]
  * extractor_key: [Extractor 文章擷取 API 金鑰]
  * x-goog-api-key: [Google Cloud Plateform 金鑰]
  