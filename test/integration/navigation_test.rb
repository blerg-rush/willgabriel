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
    click_link 'Contact Me'
    sleep 1
    fill_in 'message_name', with: @name
    fill_in 'message_email', with: @email
    fill_in 'message_phone_number', with: @phone
    fill_in 'message_body', with: @message
    click_button 'Send Email'
  end

  test 'can navigate the site' do
    visit root_url
    assert_content 'div class="greeting"'
    click_link 'Projects'
    sleep 1
    click_link 'More details'
    assert_content 'div class="projects"'
    click_link 'Blog'
    assert_content 'div class="blog"'
    click_on 'View Post'
    assert_content '| Updated: '
  end
end
