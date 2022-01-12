require 'rails_helper'

RSpec.feature "Visitor can navigate from home page to a product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )

    @product = Product.all.sample
  end

  scenario 'They see the product description page' do
    # ACT
    visit root_path
    click_on @product.name
    find('.product-detail')

    # DEBUG
    # save_screenshot
    # puts page.html

    # VERIFY
    expect(page).to have_css '.product-detail', count: 1

  end
end
