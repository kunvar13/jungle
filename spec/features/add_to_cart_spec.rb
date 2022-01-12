require 'rails_helper'

  RSpec.feature "Users can click the add to cart button", type: :feature, js: true do
   # SETUP
   before :each do
     @category = Category.create! name: 'Apparel'

      10.times do |n|
       @category.products.create!(
         name: Faker::Hipster.sentence(3),
         description: Faker::Hipster.paragraph(4),
         image: open_asset('apparel1.jpg'),
         quantity: 10,
         price: 64.99
       )
     end

      @product = Product.all.sample
   end

    scenario 'The text in navbar starts with "My Cart(0)"' do
       # ACT
       visit root_path

        # DEBUG
       # save_screenshot
       # puts page.html

        # VERIFY
       expect(page).to have_link 'My Cart (0)', count: 1
   end

    scenario 'The text in navbar goes from "My Cart(0)" to "My Cart(1)"' do
       # ACT
       visit root_path
       page.find('.product', text: @product.name).click_button('Add')

        # DEBUG
       # save_screenshot
       # puts page.html

        # VERIFY
       expect(page).to have_content 'My Cart (1)', count: 1
   end
 end
