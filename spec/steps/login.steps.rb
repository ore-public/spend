steps_for :login do
  step "会員登録ページにアクセスする" do
    visit '/users/sign_up'
  end

  step "IDとパスワードを入力する" do
    fill_in "Email", with: "test@email.com"
    fill_in "user_password", with: "test0000"
    fill_in "Password confirmation", with: "test0000"
  end

  step "登録ボタンを押す" do
    click_button "Sign up"
  end

  step "ログイン済みでトップページが開かれること" do
    current_path = URI.parse(current_url).path
    current_path.should == "/"
    User.first.email.should == "test@email.com"
  end

  step "動画管理ページにアクセスする" do
    visit '/collections'
  end

  step "ログイン画面が開かれること" do
    current_path = URI.parse(current_url).path
    current_path.should == "/users/sign_in"
  end

  step "自分が管理している作品一覧にアクセスする" do
    visit '/collections'
  end
end
