require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "データが正しく保存される" do
    before do
      @customer = Customer.new
      @customer.last_name = "田中"
      @customer.first_name = "二郎"
      @customer.last_name_kana = "タナカ"
      @customer.first_name_kana = "ジロウ"
      @customer.email = "test@example.com"
      @customer.nickname = "テスト"
      @customer.password = "password"
      @customer.password_confirmation = "password"
      @customer.save
    end
    it "全て入力してあるので保存される" do
      expect(@customer).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before do
      @customer = Customer.new
      @customer.last_name = ""
      @customer.first_name = "二郎"
      @customer.last_name_kana = "タナカ"
      @customer.first_name_kana = "ジロウ"
      @customer.email = "test@example.com"
      @customer.nickname = "テスト"
      @customer.password = "password"
      @customer.password_confirmation = "password"
      @customer.save
    end
    it "last_nameが入力されていないので保存されない" do
      expect(@customer).to be_invalid
      expect(@customer.errors[:last_name]).to include("が入力されていません")
    end
  end
end
