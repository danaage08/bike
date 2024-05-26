class ReviewsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def create
    @order = Order.find(params[:order_id])
    
    # Проверяем наличие отзыва для данного заказа
    if @order.review.present?
      redirect_to pages_message_path, alert: 'Нельзя оставлять более одного отзыва на один заказ'
      return
    end

    @review = @order.build_review(review_params)

    if @review.save
      redirect_to pages_message_path, notice: 'Отзыв успешно оставлен'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:review, :user_id)
  end
end
