class ApplicationController < ActionController::Base
  include TheRoleController

  protect_from_forgery

  # your Access Denied processor
  def access_denied
    return render(text: 'access_denied: requires an role')
  end



  # 1) LOGIN_REQUIRE => authenticate_user!    for Devise
  # 2) LOGIN_REQUIRE => require_login         for Sorcery
  # 3) LOGIN_REQUIRE => user_require_method   for other Authentication solution

  # Define aliases method for correctly work TheRole's controllers
  alias_method :login_required,     :authenticate_user!
  alias_method :role_access_denied, :access_denied



end
