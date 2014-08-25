$ ->
  $('input[type="checkbox"]#agreement').change ->
    if $('input[type="checkbox"]#agreement').prop('checked')
      $('input[type="submit"]').prop('disabled',false)
    else
      $('input[type="submit"]').prop('disabled',true)
