require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "a user should enter a first name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?	
	end

	test "a user should enter a last name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?	
	end

	test "a user should enter a profile name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?	
	end

	test "a user should have a unique profile name" do
		user = User.new
		user.profile_name = users(:jj).profile_name
		
		users(:jj)

		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a profile name without spaces" do
		user = User.new(first_name: "Warren", last_name: "Buffet", email: "warrenbuffet@gmail.com")
		user.password = user.password_confirmation = "asdfasdf"
		user.profile_name = "My Profile with Spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "profile name should be correctly formatted" do
		user = User.new(first_name: "Warren", last_name: "Buffet", email: "warrenbuffet@gmail.com")
		user.password = user.password_confirmation = "asdfasdf"
		user.profile_name = "blah_blah"
		assert user.valid?
	end
end
