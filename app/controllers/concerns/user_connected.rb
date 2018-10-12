module UserConnected
  extend ActiveSupport::Concern



  included do
  before_action :user_is_signed_in?
  end

  def user_is_signed_in?
    if admin_signed_in?
      true
    else
      render html: "you're not signed_in"
    end
  end
end
