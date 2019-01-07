# データを受け取り、返却するCGIプログラムの起動
require 'rubygems'
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンス（反応）を返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"give"のデータを cgi['give']と言う記述で取り出し、ローカル変数に代入する
  get = cgi['give']

  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>自家消費でないゴーヤの情報は下記になります</p>
      文字列：#{get}
    </body>
  </html>"
}