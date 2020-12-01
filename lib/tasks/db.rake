namespace :db do
  desc 'TODO'
  task fake_data: :environment do
    puts 'create admin user'
    User.create(email: 'admin@iuh.vn', password: '123456', password_confirmation: '123456', role: 'admin_user')

    arr_category_names = %w[samsung macbook asus acer iphone ipad lg hp lenovo]

    arr_category_names.each do |category_name|
      puts "creating category #{category_name}"
      category = Category.create(name: category_name)

      puts "creating products of category #{category_name}"
      100_000.times.each do |_product_name|
        Product.create(name: Faker::App.name, price: 2000, quantity: 5, category_id: category.id)
      end
    end
  end

  task fake_review: :environment do
    puts "hello #{Time.zone.now}"
    u = User.first
    p = Product.first
    Review.create(product_id: p.id,content: 'when ever 000001111s', rating: 4, user_id: u.id)
  end
end
