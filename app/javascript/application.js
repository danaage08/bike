// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"

let modalWallpaper = document.querySelector('.popup-wallpaper')
let profileButton = document.querySelector('.action-menu__link-new')
let profilePopup = document.querySelector('.popup-autorization')
let callbackPopup = document.querySelector('.callback-popup')
let callbackButton = document.querySelector('.action-menu__button')

// Функция для открытия модального окна профиля
profileButton.onclick = function() {
  modalWallpaper.style.display = "flex"
  profilePopup.style.display = "block"
}

// Функция для открытия модального окна обратного вызова
callbackButton.onclick = function() {
  modalWallpaper.style.display = "flex"
  callbackPopup.style.display = "block"
}

// Функция для закрытия всех модальных окон
function closeModal() {
  modalWallpaper.style.display = "none"
  profilePopup.style.display = "none"
  callbackPopup.style.display = "none"
}

// Обработчик события для кнопки закрытия профиля
document.querySelector('.popup-form__close-profile').onclick = function() {
  closeModal();
}

// Обработчик события для кнопки закрытия обратного вызова
document.querySelector('.popup-form__close-callback').onclick = function() {
  closeModal();
}

// Обработчик события для клика вне модальных окон
window.onclick = function(event) {
  if (event.target == modalWallpaper) {
    closeModal();
  }
}

let registerButton = document.querySelector('.popup__header__item_register')
let loginButton = document.querySelector('.popup__header__item_login')
let registerFrame = document.querySelector('.popup__main-register')
let loginFrame = document.querySelector('.popup__main')

registerButton.onclick = function() {
  loginFrame.style.display = "none"
  registerFrame.style.display = "block"
  registerButton.classList.add('active__popup-item')
  loginButton.classList.remove('active__popup-item')
}

loginButton.onclick = function() {
  loginFrame.style.display = "block"
  registerFrame.style.display = "none"
  registerButton.classList.remove('active__popup-item')
  loginButton.classList.add('active__popup-item')
}