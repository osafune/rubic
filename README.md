# Rubic
Rubic(ルービック)は、Ruby言語を用いた組込みボードのプロトタイピング環境です。

Rubyスクリプト入力画面でプログラムを書いたら、接続しているボードを選択して実行ボタンを押すだけで、プログラムがボード上で走り出します。

本ソフトウェアは、Google Chrome&trade;アプリとして提供され、Chromeの動作環境(Windows / Mac OS X / Linux / Chrome OS)であればどの環境でも使うことができます。

## 機能
- スケッチの編集/保存 (保存先はPCのローカルストレージ)
- Rubyからmruby中間コードへのビルドおよび対応ボードへの転送

## 対応ボード (バージョン 0.1.* 時点)
- PERIDOT (https://peridotcraft.com/)

## 構造
Rubicアプリ本体はCoffeeScriptから変換されたJavaScriptで構成されており、その内部には、emscriptenでビルドすることでJavaScriptに変換されたmrubyが同梱されています。
実行ボタンが押されると、同梱されたmrubyが内部で起動してスケッチのRubyスクリプト(.rb)をmrubyの中間コードファイル(.mrb)に変換します。
変換が成功すれば、すぐに中間コードファイルは接続した組込みボードに書き込まれ、ボードのプログラムをリセットしてすぐに動き始めます。

## 今後の予定
- 対応ボードの追加 (Wakayama.rb)
- Google Drive&trade;へのスケッチ保存
- ハードウェアカタログ機能の追加

## ライセンス
Rubic本体のソースコードは、MIT Licenseで公開されています。
- https://github.com/kimushu/rubic/

同梱された各ライブラリのライセンスについては、Menu→About this applicationから確認できます。
