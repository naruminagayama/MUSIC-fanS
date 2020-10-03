require 'rails_helper'

describe 'Customer' do

  describe 'バリデーション' do

    context '必須項目が全て埋まっている時' do
      example 'バリデーションに成功すること' do
      customer = build(:customer)
      customer.valid?
      expect(customer).to be_valid
      end
    end

    context '必須項目が全て埋まっていない時' do
      example 'バリデーションに失敗すること' do
        customer = build(:customer, email: '')
        customer.valid?
        expect(customer.errors[:email]).to include('が入力されていません')
      end
    end

  end

  describe 'フォロー機能' do

    context 'ユーザーをフォローする時' do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }
      example 'フォローに成功すること' do
        expect(customer1.follow!(customer2.id)).to be_truthy
      end
    end

    context 'ユーザーをフォローバックする時' do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }
      before do
        customer1.follow!(customer2.id)
      end
      example 'フォローバックに成功すること' do
        expect(customer1.unfollow!(customer2.id)).to be_truthy
      end
    end

  end

end