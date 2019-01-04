require 'test_helper'

class TopicControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get topic_new_url
    assert_response :success
  end

end
