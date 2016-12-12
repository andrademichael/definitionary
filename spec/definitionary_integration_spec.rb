require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the Definitionary homepage', {:type => feature}) do
  it('displays all words and allows new words to be entered') do
    visit('/')
    fill_in('new_word_input', :with => 'revolution')
    click_button('Add to the Definitionary!')
    expect(page).to have_content('revolution')
    expect(page).to have_content('Define it!')
  end
end
