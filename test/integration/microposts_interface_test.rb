require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:michael)
	end

	test "micropost interface" do
		log_in_as(@user)
		get root_path
		assert_select 'div.pagination'
		assert_select 'input[type="submit"]'
		# invalid submission
		assert_no_difference 'Micropost.count' do
			post microposts_path, params: { micropost: { content: "" } }
		end
		assert_select 'div#error_explanation'
		# valid submission
		content = "This micropost really ties the room together"
		picture = fixture_file_upload('test/fixtures/rails.jpg', 'image/jpeg', :binary)
		assert_difference 'Micropost.count', 1 do
			post microposts_path, params: { micropost: { content: content, picture: picture } }
		end
		#assert FILL_IN.picture? #see latter
		assert_redirected_to root_url
		follow_redirect!
		assert_match content, response.body
		# Delete a post.
		assert_select 'a', text: 'delete'
		first_micropost = @user.microposts.paginate(page: 1).first
		assert_difference 'Micropost.count', -1 do
			delete micropost_path(first_micropost)
		end
		# Visit a different user.
		get user_path(users(:archer))
		assert_select 'a', text: 'delete', count: 0 
	end

	test "micropost sidebar count" do
		log_in_as(@user)
		get root_path
		assert_match "#{@user.microposts.count} micropost", response.body
		# User with zero microposts
		other_user = users(:mallory)
		log_in_as(other_user)
		get root_path
		assert_match "0 microposts", response.body
		other_user.microposts.create!(content: "A micropost")
		get root_path
		assert_match "1 micropost", response.body
	end
end
