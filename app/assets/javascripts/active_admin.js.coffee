#= require active_admin/base
#= require active_admin/select2
#= require best_in_place
#= require jquery.purr
#= require bootstrap-sprockets.js
#= require modal.js
#= require best_in_place.purr

$(document).ready ->
  jQuery(".best_in_place").best_in_place()
  
  
$( "#dropdown" ).select2({
    theme: "bootstrap"
});  
  
ActiveAdmin.active_modal = (message, body)->
  html = """<div id="dialog_confirm" title="#{message}">"""
  html += "<table><tr><td>" + body + "</td></tr></table>"
  html += "</div>"
  $(html).appendTo('body').dialog
    modal: true
    dialogClass: 'active_admin_dialog'
    buttons:
      OK: ->
        $(@).dialog('close')
      Cancel: ->
        $(@).dialog('close').remove()
        