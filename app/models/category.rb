class Category < ApplicationRecord
  has_many :first_category_products, class_name: 'Product', foreign_key: 'first_category_id'
  has_many :second_category_products, class_name: 'Product', foreign_key: 'second_category_id'
  has_many :third_category_products, class_name: 'Product', foreign_key: 'third_category_id'
  has_ancestry

  def find_products(category)
    if category.first_category_products.present?
      return category.first_category_products
    elsif category.second_category_products.present?
      return second_category_products
    elsif category.third_category_products.present?
      return category.third_category_products
    end
  end
end

