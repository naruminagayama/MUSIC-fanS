App.community = App.cable.subscriptions.create { channel: "CommunityChannel", room: "1" },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    e = document.getElementById 'chats'
    current_customer = e.dataset.current_customer_id
    publisher = data['publisher']   
    $('#chats').append(data["message"])

    if publisher isnt current_customer
      lastChild = $('#chats')[0].lastElementChild
      lastChild.children[0].className = 'is_left'

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '#chat', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
    App.community.speak event.target.value
    event.target.value = ''
    event.preventDefault()