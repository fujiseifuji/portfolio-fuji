class RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  def update
    super
    update_internal
  end

  def destroy
    super
    destroy_internal
  end

  def update_internal; end

  def destroy_internal; end

  def ensure_normal_user
    redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。' if resource.email == 'guest@example.com'
  end

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end
