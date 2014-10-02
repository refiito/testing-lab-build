module.exports =
  slack:
    config:
      domain: 'domainname'
      token: 'token'
    triggers:
      finish: (user) ->
        text: "#{user.name} finished test."
        channel: '#general'
        username: 'Bot'
