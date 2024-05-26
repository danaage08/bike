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
end
