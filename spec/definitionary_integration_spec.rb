require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the Definitionary homepage', {:type => :feature}) do
  it('displays all words and allows new words to be entered') do
    visit('/')
    fill_in('new_word_input', :with => 'revolution')
    click_button('Add to the Definitionary!')
    expect(page).to have_content('revolution')
  end
end

describe('the view and add definitions page', {:type => :feature}) do
  it('displays a word, its definitions, and a form to add a definition') do
    visit('/')
    click_on('spinning')
    fill_in('Write your own definition for this word:', :with => 'turning')
    click_button('Add this definition!')
    expect(page).to have_content('turning')
  end
end
