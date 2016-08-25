require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do

  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content 'Welcome to the Car Simulator'
      end
    end
  end

  context 'Fill in the car info' do
    Steps 'Fill in a car make and year' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can fill in the make and year' do
        fill_in 'make', with: 'Toyota'
        fill_in 'year', with: '2013'
        click_button 'Create New Car'
      end
      And 'I am taken to a new page with make and year info'do
        expect(page).to have_content 'Toyota'
        expect(page).to have_content '2013'
        expect(page).to have_content '0 mph'
      end
    end
  end

  context 'Fill in the car info' do
    Steps 'Fill in a car make and year' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can fill in the make and year' do
        fill_in 'make', with: 'Honda'
        fill_in 'year', with: '2003'
        click_button 'Create New Car'
      end
      And 'I am taken to a new page with make and year info'do
        expect(page).to have_content '0 mph'
      end
    end
  end

  context 'Fill in the car info and see the status of the lights' do
    Steps 'Fill in a car make and year' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can fill in the make and year' do
        fill_in 'make', with: 'Honda'
        fill_in 'year', with: '2003'
        click_button 'Create New Car'
      end
      And 'I am taken to a new page with make, year and lights info'do
        expect(page).to have_content 'Lights: off'
      end
    end
  end

end
