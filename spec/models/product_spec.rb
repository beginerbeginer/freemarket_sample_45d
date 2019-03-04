require 'rails_helper'
describe Product do
  describe '#create' do
    it 'is valid with a all elements' do
      product = build(:product)
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without description' do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without category_id' do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it 'is invalid without product_status' do
     product = build(:product, product_status: nil)
     product.valid?
     expect(product.errors[:product_status]).to include("can't be blank")
    end

    it 'is invalid without delivery_fee' do
      product = build(:product, delivery_fee: nil)
      product.valid?
      expect(product.errors[:delivery_fee]).to include("can't be blank")
    end

    it 'is invalid without local' do
      product = build(:product, local: nil)
      product.valid?
      expect(product.errors[:local]).to include("can't be blank")
    end
  end
end
