class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      # Обработка успешного сохранения
      redirect_to profile_path, notice: 'Ваша заявка успешно отправлена!'
    else
      # Обработка ошибок сохранения
      flash[:alert] = 'Произошла ошибка. Пожалуйста, попробуйте еще раз.'
      redirect_to pages_message_path, notice: 'Ваша заявка отклонена!' # Перенаправляем обратно на страницу контактов с ошибками
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :phone_number)
  end
end
