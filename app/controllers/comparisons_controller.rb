class ComparisonsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
  end
end
