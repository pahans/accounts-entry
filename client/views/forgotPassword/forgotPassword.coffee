Template.entryForgotPassword.helpers
  error: -> Session.get('entryError')

  logo: ->
    AccountsEntry.settings.logo

Template.entryForgotPassword.events
  'submit #forgotPassword': (event) ->
    event.preventDefault()
    Session.set('email', $('input[name="forgottenEmail"]').val())

    if Session.get('email').length is 0
      Session.set('entryError', 'Email is required')
      return

    Accounts.forgotPassword({
      email: Session.get('email')
      }, (error)->
        if error
          Session.set('entryError', error.reason)
        else
          Router.go AccountsEntry.settings.homeRoute
    )
