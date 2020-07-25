->
  community_id = $('#chats').data('community_id')
  App.community = App.cable.subscriptions.create { channel: "CommunityChannel", community_id: community_id },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      if data['community_id'] is community_id
        $('#chats').append data['chat']
        # Called when there's incoming data on the websocket for this channel

    speak: (chat) ->
      @perform 'speak', chat: chat

    $(document).on 'keypress', '[data-behavior~=community_speaker]', (event) ->
      if event.keyCode is 13
        App.community.speak event.target.value
        event.target.value = ''
        event.preventDefault()