$(document).on 'change', 'input[data-photo]', ->
  reader = new FileReader()
  input = @
  reader.onload = (e) ->
    $(input).parent().append("<img src='#{e.target.result}'>")
  reader.readAsDataURL(input.files[0])

$ ->
# limits the number of photos

check_to_hide_or_show_add_link = ->
  $('[data-new-photo]').toggleClass('hidden', $('.photozone').length > 4)

$(document).on 'cocoon:after-insert', ->
  check_to_hide_or_show_add_link()
  return

$(document).on 'cocoon:after-remove', ->
  check_to_hide_or_show_add_link()
  return
