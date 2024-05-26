class SessionsController < Devise::SessionsController
  def destroy
    super do
      redirect_to root_path
    end
  end
end
