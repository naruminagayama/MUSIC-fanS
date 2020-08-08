App.community = App.cable.subscriptions.create "CommunityChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # console.log(data)
    $('#chats').append(data["message"])

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '#chat', (event) ->
  if event.keyCode is 13
    App.community.speak event.target.value
    event.target.value = ''
    event.preventDefault()