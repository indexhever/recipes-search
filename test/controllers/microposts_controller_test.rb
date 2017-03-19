require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@micropost = microposts(:orange)
  end

  test "should redirect create when not logged in" do
  	assert_no_difference 'Micropost.count' do
  		post "/microposts", params: { micropost: { content: "Lorem ipsum"} }
  	end
  	assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
  	assert_no_difference 'Micropost.count' do
  		delete "/microposts/#{@micropost.id}", params: { id: @micropost }
  	end
  	assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:lana))
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do
      delete "/microposts/#{@micropost.id}", params: { id: @micropost }
    end
    assert_redirected_to root_url
  end
end
