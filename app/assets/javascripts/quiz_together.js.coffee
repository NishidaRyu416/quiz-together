window.App = angular.module('QuizTogether', ['ngResource'])

# Ajax送信時にトークンを送信する（トークンがないとRails側で認証エラーになる）
App.config ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    document.getElementsByName("csrf-token")[0].content
