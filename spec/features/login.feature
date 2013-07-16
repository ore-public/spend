Feature: ログイン

  @login
  Scenario: 入会する
    Given 会員登録ページにアクセスする
    When IDとパスワードを入力する
    And 登録ボタンを押す
    Then ログイン済みでトップページが開かれること
