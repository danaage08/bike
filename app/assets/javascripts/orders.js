// app/assets/javascripts/orders.js
document.addEventListener("DOMContentLoaded", function() {
  document.querySelectorAll('.button_cancel').forEach(function(button) {
    button.addEventListener('click', function(event) {
      event.preventDefault(); // Предотвращаем переход по ссылке

      var orderId = this.getAttribute('data-popup-id').split('-')[3]; // Получаем ID заказа из атрибута data-popup-id
      var url = this.getAttribute('href'); // Получаем URL для отправки AJAX запроса

      fetch(url, {
        method: 'PATCH', // Используем метод PATCH
        headers: {
          'X-CSRF-Token': Rails.csrfToken(),
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ id: orderId }) // Отправляем ID заказа в теле запроса
      })
      .then(function(response) {
        if (response.ok) {
          // Если ответ успешный, обновляем статус заказа на странице
          document.getElementById('order-status-' + orderId).innerText = 'отменен';
        } else {
          console.error('Ошибка при отмене заказа');
        }
      })
      .catch(function(error) {
        console.error('Произошла ошибка:', error);
      });
    });
  });
});
