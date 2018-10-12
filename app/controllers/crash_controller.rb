class CrashController < ApplicationController
  include UserConnected
 
  def by_years
    @by_years = Crash.sort_by_years
  end

  def show
    @crash = Crash.find_by(identifier: params[:identifier])
  end

end
