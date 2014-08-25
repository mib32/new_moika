@loadIvideon = ->
  console.log "loadIvideon begin"
  youtube_src1 = $('#youtube_top_1').data('youtube-src')
  $('#youtube_top_1 iframe').attr('src', youtube_src1)

  urls = [
    $('#video_top_1').data('ivideonUrl1')
    $('#video_top_2').data('ivideonUrl2')
    $('#video_top_3').data('ivideonUrl3')
    $('#video_top_4').data('ivideonUrl4')
    $('#video_top_5').data('ivideonUrl5')
    $('#video_top_6').data('ivideonUrl6')
  ]
  for url,i in urls
    target = '#video_top_' + (++i) + ' .iv-embed .iv-v iframe'
    if url?
      $(target).attr('src', url)
