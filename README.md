# Jumbo

_A better jump command for Vim_

Readable code groups related statements together,
and separates these groups by empty lines from each other.
To make it easy to distinguish methods from such code blocks,
and to give code some room to breathe,
its best to separate methods with 2 empty lines.
Like so:

```coffeescript
createAccount: (email, age, done) ->
  return done "You are too young" if age < 18
  return done "Invalid email" if isInvalidEmail(email)

  createUser {email, age}, (err, user) ->
    return done "Internal server error" if err

    user.sendWelcomeEmail()
    user.setTrialMembership()
    user.giveWelcomeCredits()


deleteAccount: (email, done) ->
  return done "No email given" if isInvalidEmail(email)

  user.endMembership()
  user.payoutCredits()
  user.sendGoodbyeEmail()

  deleteUser {email}, done


renewAccount: (email, period, done) ->
  # ...
```

If this is your style, and you use Vim,
Jumbo provides two new VimL methods called
`JumpToNextMethod` and `jumpToPreviousMethod`
that allow to navigate very intuitively by jumping to the next/previous
method.


## Installation

#### Vundle users

* add `Bundle 'kevgo/jumbo'` to your .vimrc file
* run `:BundleInstall` from within Vim

#### Pathogen users

`git clone git://github.com/kevgo/jumbo.git ~/.vim/bundle`


#### Activation in Vim

To replace the normal `{` and `}` commands with Jumbo:

```viml
nnoremap { :call JumpToPreviousFunction()<CR>
nnoremap } :call JumpToNextFunction()<CR>
```

