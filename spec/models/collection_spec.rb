require 'spec_helper'

describe Collection do
  context "正常系パターンで登録した場合" do
    before do
      u = User.create!(email: 'test@email.com', password: 'test0000')
      @c = Collection.new
      @c.owner = u
      @c.authentication = :unnecessary
      @c.save
    end

    it "正常に登録できること" do
      @c.owner.email.should == 'test@email.com'
    end
  end
end
