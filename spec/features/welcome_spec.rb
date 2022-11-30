require 'rails_helper'

RSpec.describe 'landing/welcome page' do
  it 'should have a header' do
    visit ('/')
    expect(page).to have_content('The Motion-Picture')
  end

  it 'should have links that take users to desired index pages' do
    visit ('/')

    click_on ('Directors')
    expect(current_path).to_not eq("/")
    expect(current_path).to_not eq(films_path)
    expect(current_path).to eq(directors_path)

    visit ('/')
    click_on ('Films')
    expect(current_path).to_not eq("/")
    expect(current_path).to_not eq(directors_path)
    expect(current_path).to eq(films_path)
  
    visit ('/')
    click_on ('Main')
    expect(current_path).to_not eq(directors_path)
    expect(current_path).to_not eq(films_path)
    expect(current_path).to eq("/")
  end
end