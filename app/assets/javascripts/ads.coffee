# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

dataConfirmModal.setDefaults
  title: 'Confirmación de eliminación'
  commit: 'Eliminar'
  cancel: 'Cancelar'


hide_carousel_part = ->
  if $('#check_important').is(':checked')
    $('#carousel_part').show()
  else
    $('#carousel_part').hide()
  return

unload = ->

ready = ->
  $('#title_alert').hide()
  $('#description_alert').hide()

  # ------- Cosas del preview de Markdown -------
  options_editor =
    textarea: 'input_description'
    button:
      preview: true
      fullscreen: false
      bar: 'show'
    string:
      togglePreview: 'Vista previa'
      toggleEdit: 'Editar'
      toggleFullscreen: 'Entrar en pantalla completa'
    autogrow:
      minHeight: 350
      maxHeight: 350

  editor = (new EpicEditor(options_editor)).load()
  # ---------------------------------------------


  hide_carousel_part()

  $('#check_important').click ->
    if $(this).is(':checked')
      $('#carousel_part').fadeIn()
    else
      $('#carousel_part').fadeOut()
    return

  $('#input_title').blur ->
    val = $('#input_title').val()
    if val == ''
      $('#title_alert').fadeIn()
    else
      $('#title_alert').fadeOut()
    return

  $('#input_description').blur ->
    val = $('#input_description').val()
    if val == ''
      $('#description_alert').fadeIn()
    else
      $('#description_alert').fadeOut()
    return

$(document).ready ready
$(document).on 'page:load', ready
$(document).unload unload