module.exports =
  github:
    clientID: '1122'
    clientSecret: '3344'
    callbackURL: "/auth/github/callback"
    scope: ['user:email']
 
  linkedIn:
    clientID: '5566'
    clientSecret: '7788'
    callbackURL: '/auth/linkedin/callback'
    scope: [
      'r_emailaddress',
      'r_basicprofile'
    ]
    profileFields: [
      'id',
      'picture-url',
      'first-name',
      'last-name',
      'email-address',
      'public-profile-url'
    ]
    # A long unique string value of your choice that is hard to guess.
    # Used to prevent CSRF.
    state: 'blahblah'
 
  facebook:
    clientID: '88999'
    clientSecret: '4433'
    callbackURL  : '/auth/facebook/callback'
    profileFields: ['email', 'first_name', 'last_name', 'link', 'id']
 
  google:
    clientID: 'ffffooo'
    clientSecret: 'changeme'
    callbackURL: '/auth/google/callback'

  redirects:
   failureRedirect : '/'
   successRedirect : '/'