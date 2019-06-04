
# frozen_string_literal: true

class Mentors::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = Mentor.from_omniauth(request.env['omniauth.auth'])
    if @user.nil?
      flash[:danger] = I18n.t('user.notexisted')
      redirect_to new_mentor_session_path
    elsif @user.persisted?
      flash[:success] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    end
  end
end
