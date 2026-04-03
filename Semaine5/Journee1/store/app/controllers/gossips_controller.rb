class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all.includes(:user)
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
end