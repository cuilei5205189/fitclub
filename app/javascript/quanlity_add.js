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