
# Datetimepicker
$(document).on 'turbolinks:load', ->
  $('.dtpicker').datetimepicker
    locale: 'es',
    format: 'DD/MM/YYYY'

  $('.form_datepicker').datetimepicker
    locale: 'es',
    format: 'DD/MM/YYYY'

  $('.form_datepicker_current').datetimepicker
    locale: 'es',
    format: 'DD/MM/YYYY'
    defaultDate: moment()

  $('.form_datetimepicker').datetimepicker
    locale: 'es',
    format: 'DD/MM/YYYY hh:ii'


#dropdown-submenu
$(document).on 'turbolinks:load', ->
  $('.dropdown-submenu a.test').on 'click', (e) ->
    $('.dropdown-open').hide();
    $('.dropdown-open').removeClass('dropdown-open');
    $(this).next('ul').addClass('dropdown-open');
    $(this).next('ul').toggle()
    e.stopPropagation()
    e.preventDefault()
    return
  return

# Desactiva scrolls en campos input del tipo number
$(document).ready ->
  $(':input[type=number]').on 'mousewheel', (e) ->
    $(this).blur()
    return
  return
