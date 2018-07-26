import 'bootstrap/dist/js/bootstrap'
import 'daemonite-material/js/material.min'

$(() => {

    $('.js-area-select').html('aaa')
})


const api = () => {
    $.ajax({
        url: '',
        type: 'POST',
        success: function(data) {
        },
        error: function(err) {
            console.log(err)
        }
    })
}