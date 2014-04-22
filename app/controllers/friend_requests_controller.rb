class FriendRequestsController < ApplicationController
  before_action :require_signed_in!
  before_action :authorized?, only: [:accept, :deny]

  def create
    @friend_request = current_user.friend_requests.new({
      in_friend_id: params[:user_id]
    })
    if @friend_request.save
      redirect_to users_url
    else
      flash[:errors] = @friend_request.errors.full_messages
      redirect_to users_url
    end
  end

  def deny
    @friend_request = FriendRequest.find(params[:friend_request_id])
    @friend_request.destroy
    redirect_to users_url
  end

  def accept
    @friend_request = FriendRequest.find(params[:friend_request_id])
    create_friendships(@friend_request)
    @friend_request.destroy
    redirect_to users_url
  end

  private
  def authorized?
    current_user.id == params[:user_id]
  end

  def create_friendships(friend_request)
    Friendship.create!({
      in_friend_id: friend_request.in_friend_id,
      out_friend_id: friend_request.out_friend_id
    })
    Friendship.create!({
      in_friend_id: friend_request.out_friend_id,
      out_friend_id: friend_request.in_friend_id
    })
  end
end