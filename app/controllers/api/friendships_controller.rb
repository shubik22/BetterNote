class Api::FriendshipsController < ApplicationController
  before_action :require_signed_in!

  def destroy
    @friendship = current_user.friendships.find_by({
      in_friend_id: params[:id]
    })
    @opposite_friendship = Friendship.find_by({
      in_friend_id: @friendship.out_friend_id,
      out_friend_id: @friendship.in_friend.id
    })

    @friendship.destroy
    @opposite_friendship.destroy
    render json: {}
  end
end