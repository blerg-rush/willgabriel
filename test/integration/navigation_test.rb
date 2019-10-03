require 'application_system_test_case'

class NavigationTest < ApplicationSystemTestCase
  def setup
    @name = 'Test'
    @email = 'test@test.com'
    @phone = '123 456-7890'
    @message = "I'm making a note here: 'HUGE SUCCESS!'"
  end

  test 'can send an email' do
    visit root_url
    assert_content 'greeting'
    page.execute_script('window.scrollTo(0,10000)')
    sleep 1
    fill_in 'message_name', with: @name
    fill_in 'message_email', with: @email
    fill_in 'message_phone_number', with: @phone
    fill_in 'message_body', with: @message
    click_button('Send Email')
  end
end
