namespace :db do
  desc "TODO"
  task fake_data: :environment do
    arr_category_names = %w[samsung macbook asus acer iphone ipad lg hp lenovo]

    arr_category_names.each do |category_name|
      puts "creating category #{category_name}"
      category = Category.create(name: category_name)

      puts "creating products of category #{category_name}"
      ['p1','p2'].each do |product_name|
        Product.create(name: product_name, price: 2000, quantity: 5, category_id: category.id)
      end
    end
  end
end
