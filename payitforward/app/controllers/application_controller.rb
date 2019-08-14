class ApplicationController < ActionController::Base
  def root
    gon.ally_place = AllyPlace.all
  end
end
