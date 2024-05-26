class OrdersController < ApplicationController
  # Ваш контроллер заказов (orders_controller.rb)

  def new
    @selected_bikes = params[:bikes].split(",") if params[:bikes].present?
    @order = Order.new
    @delivery_address = current_user.delivery_address if user_signed_in?
  end

  def extend
    @order = Order.find(params[:id])
    summ_bike = 0
    @order.bikes.each do |bike|
      summ_bike += bike.price
    end
    @order.update(end_date: @order.end_date + 1, total_price: @order.total_price + summ_bike)
    redirect_to profile_path
  end

  def create
    @order = Order.new(order_params.merge(bike_ids: params[:order][:bike_ids].split(",")))
    # Дополнительная обработка сохранения заказа
    if @order.save
      redirect_to profile_path, notice: 'Заказ успешно создан.'
    else
      render :new
    end
  end

 def cancel
  @order = Order.find(params[:id])

  # Обновляем статус велосипедов в зависимости от статуса заказа
  if @order.update(admin_status: 'cancel')
    @order.bikes.each do |bike|
      bike.update(status: :free)
    end

    redirect_to profile_path, notice: 'Заказ успешно отменен'
  else
    redirect_to profile_path, alert: 'Ошибка при отмене заказа'
  end
end


  private

  def review_params
    params.require(:review).permit(:review, :user_id)
  end

  def order_params
    params.require(:order).permit(:start_date, :end_date, :delivery_address, :return_address, :user_id, :status, :admin_status, :total_price, :bike_ids) # Включаем bike_ids
  end
end
