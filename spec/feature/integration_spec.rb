# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J. K. Rowling'
    fill_in 'Price', with: '40.99'

   
    select '2020', :from => 'book_published_date_1i'      # Year
    select 'November', :from => 'book_published_date_2i'  # Month
    select '16', :from => 'book_published_date_3i'        # Day

    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('J. K. Rowling')
    expect(page).to have_content('40.99')
    expect(page).to have_content('2020-11-16')
  end
end

