$(document).on 'change', 'input[data-photo]', ->
  reader = new FileReader()
  input = @
  reader.onload = (e) ->
    $(input).siblings('img').prop('src', e.target.result)
    $(input).parents('.hidden').removeClass('hidden')
reader.readAsDataURL(input.files[0])