class FriendshipsController < ApplicationController

def create
    user = User.find_by(id: friendship_params[:user_id])
    friend = User.find_by(id: friendship_params[:friend_id])
end

private

def friendship_params
    params.require(:friendship).permit(:friend_id, :user_id)
end

end
