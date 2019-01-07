require 'webrick'

server = WEBrick::HTTPServer.new({
  DocumentRoot:   'rdbms-sql-kouheiishiro.c9users.io',
  BindAddress:    "0.0.0.0",
  Port:           8080,
  # ここのruby-2.4.0の記述は、自分の環境で ruby -v のコマンドを打ち、出力されたrubyのバージョンを書き込むこと
  # 例えば、 ruby -v のコマンドで2.3.4と出てきたときには、ruby-2.3.4 という記述をする。
  CGIInterpreter: '/usr/local/rvm/rubies/ruby-2.4.0/bin/ruby'
})

# WEBrick::HTTPServlet::FileHandlerをWEBrick::HTTPServlet::ERBHandlerに変更する
# 'test.html'を'test.html.erb'に変更する
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'top.html.erb')
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')

server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')

server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/give.cgi', WEBrick::HTTPServlet::CGIHandler, 'give.rb')
server.mount('/bad.cgi', WEBrick::HTTPServlet::CGIHandler, 'bad.rb')

server.start