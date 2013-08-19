# jGrowl設定
$ ->
  notice = $('#notice').text()
  if notice.length > 0
    $.jGrowl notice,
      closer: false
      closeTemplate: ''

  alert = $('#alert').text()
  if alert.length > 0
    $.jGrowl alert,
      closer: false
      closeTemplate: ''
