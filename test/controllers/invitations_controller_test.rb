require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  setup do
    @invitation = invitations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invitations)
  end

  test "should create invitation" do
    assert_difference('Invitation.count') do
      post :create, invitation: { new: @invitation.new, recipient_phone: @invitation.recipient_phone, sender_id: @invitation.sender_id, sent_at: @invitation.sent_at, token: @invitation.token }
    end

    assert_response 201
  end

  test "should show invitation" do
    get :show, id: @invitation
    assert_response :success
  end

  test "should update invitation" do
    put :update, id: @invitation, invitation: { new: @invitation.new, recipient_phone: @invitation.recipient_phone, sender_id: @invitation.sender_id, sent_at: @invitation.sent_at, token: @invitation.token }
    assert_response 204
  end

  test "should destroy invitation" do
    assert_difference('Invitation.count', -1) do
      delete :destroy, id: @invitation
    end

    assert_response 204
  end
end
