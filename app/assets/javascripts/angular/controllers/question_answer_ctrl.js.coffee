
# 初期表示時の投稿フォーム初期値
  $scope.newQuestionAnswer = {user_name:gon.user_name}

  # postを全件取得
  QuestionAnswer.query (question_answers) ->
    $scope.question_answers = question_answers
    $interval fetchUnread, 3* 1000  #未読分を５秒毎に取得する

  # 未読分の取得
  fetchUnread = ->
    lastId = $scope.question_answers[$scope.question_answers.length - 1].id
    QuestionAnswer.query 'q[id_gt]': lastId, (question_answers) ->
      $scope.question_answers.push.apply($scope.question_answers, question_answers)
  # submit時に呼び出される
  $scope.create = ->
    # 保存
    question_answer = QuestionAnswer.save($scope.newQuestionAnswer)
    # 未読postの取得
    fetchUnread()
