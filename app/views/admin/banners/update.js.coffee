label = $("#top_text_banner form label")
target2 = $("body")
prev_html = label.html()
console.log(prev_html)
target2.effect("highlight", {color: "eb9316"}, 2000)
label.html("Обновлено").show("slow").effect("highlight", {color: "#f77"}, 3000)
setTimeout ( ->
  label.html(prev_html)
), 3000

$("h4.banner_text#" + "<%= @banner.id %>").html("<%= @banner.text %>")
