require 'test_helper'

class ParentMailerTest < ActionMailer::TestCase
  test "visit_happened" do
    mail = ParentMailer.visit_happened
    assert_equal "Visit happened", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "welcome" do
    mail = ParentMailer.welcome
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "getting_started" do
    mail = ParentMailer.getting_started
    assert_equal "Getting started", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
