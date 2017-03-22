$(document).on 'change', 'input[data-photo]', ->
  reader = new FileReader()
  input = @
  reader.onload = (e) ->
    $(input).siblings('img').prop('src', e.target.result)
    $(input).parents('.hidden').removeClass('hidden')
  reader.readAsDataURL(input.files[0])

$ ->

  check_to_hide_or_show_add_link = (limit) ->
    $('[data-new-photo]').toggleClass('hidden', $('.photozone:visible').length > limit)

  $(document).on 'cocoon:after-insert', ->
    check_to_hide_or_show_add_link(3)
    $('input[data-photo]:last').click()

  $(document).on 'cocoon:after-remove', ->
    check_to_hide_or_show_add_link(4)
