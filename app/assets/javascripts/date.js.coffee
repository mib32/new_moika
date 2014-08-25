$ ->
  setInterval ->
    date_now = new Date()
    _html = """
      #{ru_Date.abbreviatedDayNames[date_now.getDay()]}
       
      #{date_now.getDate()}
       
      #{ru_Date.monthNames[date_now.getMonth()]}
       
      #{date_now.getFullYear()}
      &nbsp;г.
            """
    $(".datetime .date").html(_html)
    $(".datetime .time").html(" | #{date_now.toLocaleTimeString()} | ")
  ,500
