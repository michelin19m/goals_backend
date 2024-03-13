require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "stat_reminder_email" do
    mail = UserMailer.stat_reminder_email
    assert_equal "Stat reminder email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
