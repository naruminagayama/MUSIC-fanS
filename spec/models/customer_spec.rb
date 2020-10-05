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

  describe 'follow!(customer_id)' do

    context 'フォローしていないカスタマーIDを渡す時' do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }
      example 'フォローに成功すること' do
        expect(customer1.follow!(customer2.id)).to be_truthy
      end
    end

    context 'フォロー済みのカスタマーIDを渡す時' do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }
      before do
        customer1.follow!(customer2.id)
      end
      example '例外処理が発生すること' do
        expect{customer1.follow!(customer2.id)}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context '存在しないカスタマーIDを渡す時' do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }
      before do
        customer2.destroy
      end
      example '例外処理が発生すること' do
        expect{customer1.follow!(customer2.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

  end

  describe 'unfollow!(customer_id)' do

    context 'フォロー済のカスタマーIDを渡す時' do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }
      before do
        customer1.follow!(customer2.id)
      end
      example 'フォローの解除に成功すること' do
        expect(customer1.unfollow!(customer2.id)).to be_truthy
      end
    end

    context 'フォローしていないカスタマーIDを渡す時' do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }
      example '例外処理が発生すること' do
        expect{customer1.unfollow!(customer2.id)}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context '存在しないカスタマーIDを渡す時' do
      let!(:customer1) { create(:customer) }
      let!(:customer2) { create(:customer) }
      before do
        customer2.destroy
      end
      example '例外処理が発生すること' do
        expect{customer1.unfollow!(customer2.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

  end

end