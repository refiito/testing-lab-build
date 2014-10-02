path = require 'path'

module.exports =
  frontend: path.resolve __dirname, '../../frontend'

  # Some random unique string. Used by express
  sessionKey : 'RGeHSH8BepfBfHh9'
  admins     : ['email@example.com']
