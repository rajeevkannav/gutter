require 'test_helper'

module Gutter
  class GutterControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
