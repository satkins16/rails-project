class GiversController < ApplicationController

  def index
    @givers = []
    current_user.gifts.each do |gift|
      gift.givers.each do |giver|
        @givers << giver
      end
    end
  end

end
