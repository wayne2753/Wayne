import flatpickr from 'flatpickr/dist/flatpickr.min.js'
import 'flatpickr/dist/flatpickr.min.css'


document.addEventListener('turbolinks:load', function(){
    flatpickr("#book_published_at", {})
})