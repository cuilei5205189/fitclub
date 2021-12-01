// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

// import Rails from "@rails/ujs"
// Rails.start() 


document.addEventListener("turbo:load", () => {
  if (document.querySelector('.alert')) {
    var alertNode = document.querySelector('.alert')
    setTimeout(() => {
      alertNode.classList.add('slideup')
      alertNode.addEventListener('animationend', () => {
        alertNode.remove()
      })
    }, 2000)
  } 
})

document.addEventListener('turbo:load', function() { 
  console.log('quanlity_add.js');
  if (document.getElementById('quanlity')) {
    document.querySelector('#quanlity .btn_add_quanlity').addEventListener('click', function() {
      let input = document.querySelector('#quanlity input')
      input.value = parseInt(input.value) + 1
    })
    document.querySelector('#quanlity .btn_cancel_quanlity').addEventListener('click', function() {
      let input = document.querySelector('#quanlity input')
      if(input.value>1) { 
        input.value = parseInt(input.value) - 1
      }
    })
  }
});
