class PagesController < ApplicationController
  def home
    @page_title = '| Велопрокат'

    @bike_types = Bike.distinct.pluck(:bike_type) # Получаем все уникальные типы велосипедов

    @bikes = Bike.all

    # Применяем фильтр по типу велосипеда
    if params[:bike_type].present?
      @bikes = @bikes.where(bike_type: params[:bike_type])
    end

    # Применяем фильтр по цене
    if params[:min_price].present?
      @bikes = @bikes.where('price >= ?', params[:min_price])
    end

    if params[:max_price].present?
      @bikes = @bikes.where('price <= ?', params[:max_price])
    end

    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @bikes = @bikes.select { |bike| bike.available?(start_date, end_date) }
    end
  end

  def delivery
    @page_title = '| Где кататься'
  end

  def message
    
  end

  def rules
    @page_title = '| Правила'
    @horizonts = Horizont.last(4).reverse # Получаем последние четыре объекта и переворачиваем порядок, чтобы отобразить их в порядке создания
  end

  def contacts
    @page_title = '| Контакты'
    @review = Review.new
  end

  def about
    @page_title = '| О нас'
    @reviews = Review.last(3).reverse
  end

  def create_helpt
    @helpt = Helpt.new(helpt_params)
    if @helpt.save
      redirect_to root_path, notice: 'Заявка успешно отправлена'
    end
  end

  private

  def helpt_params
    params.require(:helpt).permit(:name, :phone_number, :status)
  end
end
