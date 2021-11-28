// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"


document.addEventListener("turbo:load", () => {
  if (document.querySelector('.alert')) {
    var alertNode = document.querySelector('.alert')
    setTimeout(() => {
      alertNode.classList.add('slideup')
      alertNode.addEventListener('animationend', () => {
        alertNode.remove()
        console.log('removed')
      })
    }, 2000)
  } 
})
