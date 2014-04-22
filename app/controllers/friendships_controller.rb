class FriendshipsController < ApplicationController
  before_action :require_signed_in!

  def destroy
    @friendship = Friendship.find(params[:id])
    @opposite_friendship = Friendship.find_by({
      in_friend_id: @friendship.out_friend_id,
      out_friend_id: @friendship.in_friend.id
    })

    @friendship.destroy
    @opposite_friendship.destroy
    redirect_to users_url
  end
end