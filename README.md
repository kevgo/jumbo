# Jumbo

Separating methods with 2 empty lines makes code not only more readable,
it also allows Vim users to jump to the next/previous method using this plugin.


## Installation

This is a normal Vim plugin.
Install it like you install all your other plugins.


##### Vundle users

* add `Bundle 'kevgo/jumbo'` to your .vimrc file
* restart Vim and run `:BundleInstall`

##### Pathogen users

* `git clone git://github.com/kevgo/jumbo.git ~/.vim/bundle`
* restart Vim


#### Activation in Vim

Jumbo provids the two VimL methods `JumpToNextMethod` and `JumpToPreviousMethod`,
which do exactly what their name says.

To replace the normal `{` and `}` commands with Jumbo, add this to your `.vimrc` file:

```viml
nnoremap { :call JumpToPreviousFunction()<CR>
nnoremap } :call JumpToNextFunction()<CR>
```
