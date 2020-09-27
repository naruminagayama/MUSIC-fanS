require 'rails_helper'

RSpec.describe 'バリデーション', type: :model do
  context "必須項目が全て埋まっている時" do
    before do
      @customer = Customer.new
      @customer.last_name = '田中'
      @customer.first_name = '二郎'
      @customer.last_name_kana = 'タナカ'
      @customer.first_name_kana = 'ジロウ'
      @customer.email = 'test@example.com'
      @customer.nickname = 'テスト'
      @customer.password = 'password'
      @customer.password_confirmation = 'password'
    end
    example 'バリデーションに成功する' do
      expect(@customer).to be_valid
    end
  end

  context '必須項目が全て埋まっていない時' do
    before do
      @customer = Customer.new
      @customer.last_name = ''
      @customer.first_name = '二郎'
      @customer.last_name_kana = 'タナカ'
      @customer.first_name_kana = 'ジロウ'
      @customer.email = 'test@example.com'
      @customer.nickname = 'テスト'
      @customer.password = 'password'
      @customer.password_confirmation = 'password'
    end
    example 'バリデーションに失敗する' do
      expect(@customer).to be_invalid
      expect(@customer.errors[:last_name]).to include('が入力されていません')
    end
  end
end
