class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def after_sign_out_path_for(users)
    root_path
  end

  def after_sign_in_path_for(user)
    if (cookies[:waiting_for_payment])
      cookies.delete :waiting_for_payment
      return "/pagamento"
    end

    if (!user.admin)
      "/profile/#{user.id}"
    else
      admin_index_path
    end
  end
end
