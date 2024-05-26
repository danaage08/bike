class ProfilesController < ApplicationController
  before_action :authenticate_user! # Проверяет, что пользователь аутентифицирован, иначе перенаправляет на страницу входа

  def show
    @user_orders = current_user.orders
    @user = current_user
  end
end
