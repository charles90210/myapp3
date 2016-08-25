require 'rails_helper'

RSpec.feature "CarSimulators", type: :feature do
  context  'I have created a car, when I click an accelerate button, then I make it speed up in 10Km/h increments' do
    Steps 'click the accelerate button' do
      Given 'i am on the simulator page' do
        visit '/'
      end
      Then 'I can click the accelerator button' do
        fill_in 'make', with: 'Toyota'
        fill_in 'year', with: '2013'
        click_button 'Create New Car'
        click_button 'Accelerate'
      end
      And 'speed up the car' do
        expect(page).to have_content '10 mph'
      end
    end
  end

  context  'I have created a car, when I click a brake button, the car speed goes down 7mph increments' do
    Steps 'click the brake button' do
      Given 'i begin on the home page' do
        visit '/'
      end
      Then 'I can create a new car and then click the brake button on the simulator page' do
        fill_in 'make', with: 'Toyota'
        fill_in 'year', with: '2013'
        click_button 'Create New Car'
        click_button 'Accelerate'
        click_button 'Brake'
      end
      And 'slow down the car' do
        expect(page).to have_content '3 mph'
      end
    end
  end

  context  'I have created a car, when I click a brake button, the car speed does not go below 0mph' do
    Steps 'click the brake button' do
      Given 'i begin on the home page' do
        visit '/'
      end
      Then 'I can create a new car and then click the brake button on the simulator page' do
        fill_in 'make', with: 'Toyota'
        fill_in 'year', with: '2013'
        click_button 'Create New Car'
        click_button 'Accelerate'
        click_button 'Brake'
        click_button 'Brake'
      end
      And 'slow down the car to 0' do
        expect(page).to have_content '0 mph'
      end
    end
  end

  context 'Fill in the car info and change the status of the lights' do
    Steps 'Fill in a car make and year' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can fill in the make and year' do
        fill_in 'make', with: 'Honda'
        fill_in 'year', with: '2003'
        click_button 'Create New Car'
        click_button 'Lights'
        click_button 'Lights'
      end
      And 'I am taken to a new page where I can turn the lights on or off'do
        expect(page).to have_content 'Lights: off'
      end
    end
  end

  context 'Fill in the car info and change the status of the parking brake' do
    Steps 'Fill in a car make and year' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can fill in the make and year' do
        fill_in 'make', with: 'Honda'
        fill_in 'year', with: '2003'
        click_button 'Create New Car'
        choose 'parking_brake_pb_on'
        click_button 'Update Parking Brake'
      end
      And 'I am taken to a new page where I can turn the parking brake on or off' do
        expect(page.find_by_id('parking_brake_pb_on')).to be_checked
      end
    end
  end
end
