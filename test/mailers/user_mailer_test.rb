require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "status_boarding" do
    mail = UserMailer.status_boarding
    assert_equal "Status boarding", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
