require 'test_helper'

class ReviewsMilerTest < ActionMailer::TestCase
  test "new_review_email" do
    mail = ReviewsMiler.new_review_email
    assert_equal "New review email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
