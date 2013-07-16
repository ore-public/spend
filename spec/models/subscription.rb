require 'spec_helper'

describe Subscription do
  context "正常系パターンで登録した場合" do
    before do
      u = User.create!(email: 'test@email.com', password: 'test0000')
      @s = Subscription.new
      @s.user = u
      @s.save!
    end

    it "正常に登録できること" do
      @s.user.email.should == 'test@email.com'
    end
  end
end
