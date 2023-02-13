require "test_helper"

class Public::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get public_students_mypage_url
    assert_response :success
  end
end
