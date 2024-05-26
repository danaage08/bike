class PagesController < ApplicationController
  def home
    @page_title = '| Велопрокат'
    @bikes = Bike.all
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
  end

  def about
    @page_title = '| О нас'
    @reviews = Review.last(3).reverse
  end

  def create_helpt
    @helpt = Helpt.new(helpt_params)
    if @helpt.save
      redirect_to root_path, notice: 'Заявка успешно отправлена'
    else
      flash.now[:alert] = 'Произошла ошибка при отправке заявки'
      render :contacts # Или любой другой шаблон, где у вас форма контактов
    end
  end

  private

  def helpt_params
    params.require(:helpt).permit(:name, :phone_number, :status)
  end
end
