App.community = App.cable.subscriptions.create { channel: "CommunityChannel", room: location.pathname.match(/\d+/)[0] },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#chats').append(data["message"])

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '#chat', (event) ->
  if event.keyCode is 13
    App.community.speak event.target.value
    event.target.value = ''
    event.preventDefault()