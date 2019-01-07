# データを受け取り、返却するCGIプログラムの起動
require 'rubygems'
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンス（反応）を返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"bad"のデータを cgi['bad']と言う記述で取り出し、ローカル変数に代入する
  get = cgi['bad']

  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>品質が悪いゴーヤの情報は下記になります</p>
      <a href='/'>topページへ飛びます</a><br>
      文字列：#{get}
    </body>
  </html>"
}