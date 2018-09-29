class CrashController < ApplicationController
  def show
    @crash = Crash.find_by(identifier: params[:identifier])
  end
end
