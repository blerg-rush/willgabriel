require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @name = 'Test'
    @email = 'test@test.com'
    @phone = '123 456-7890'
    @body = "I'm making a note here: 'HUGE SUCCESS!'"
  end

  test 'Complete form validates' do
    message = Message.new(name: @name, email: @email,
                          phone_number: @phone, body: @body)
    assert message.valid?
  end
end
