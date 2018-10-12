class CrashController < ApplicationController
  include UserConnected
  
  def show
    @crash = Crash.find_by(identifier: params[:identifier])
  end

end
