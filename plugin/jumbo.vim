" Helper method to move to the next line
"
" Returns whether we have reached the end of the file
function! MoveDown()
  let old_line_number=getpos('.')[1]
  normal j
  let new_line_number=getpos('.')[1]
  if old_line_number == new_line_number
    echo 'reached the end of the file'
    return 1
  else
    return 0
  endif
endfunction


" Helper method to move to the previous line
"
" Returns whether we have reached the end of the file
function! MoveUp()
  let old_line_number=getpos('.')[1]
  normal k
  let new_line_number=getpos('.')[1]
  if old_line_number == new_line_number
    echo 'reached the beginning of the file'
    return 1
  else
    return 0
  endif
endfunction


" Jumps to the beginning of the next function
function! JumpToPreviousFunction()

  " counts the number of consecutive empty lines encountered so far
  let empty_line_count=0

  " signals that we have found the beginning of the next method
  let found_next_method=0

  " don't stop until we have reached the beginning of the next method
  while !found_next_method

    " get the content of the current line
    let line=getline('.')
    if empty(line)
      " found an empty line --> increase the empty line counter
      let empty_line_count=empty_line_count+1

      " keep moving down, because we want to stop at the first line of the
      " next methods
      let found_next_method=MoveUp()
    else
      " non-empty line found here
      if empty_line_count>1
        " this is a non-empty line after at least two empty lines in a row --> the next method!
        let found_next_method=1
      else
        " not the beginning of the next method --> keep moving down
        let found_next_method=MoveUp()
      endif

      " here we are on a non-empty line --> reset the empty line counter
      let empty_line_count=0
    endif
  endwhile
endfunction


" Jumps to the end of the previous function
function! JumpToNextFunction()

  " counts the number of consecutive empty lines encountered so far
  let empty_line_count=0

  " signals that we have found the beginning of the next method
  let found_previous_method=0

  " don't stop until we have reached the beginning of the next method
  while !found_previous_method

    " get the content of the current line
    let line=getline('.')
    if empty(line)
      " found an empty line --> increase the empty line counter
      let empty_line_count=empty_line_count+1

      " keep moving down, because we want to stop at the first line of the
      " next methods
      let found_previous_method=MoveDown()
    else
      " non-empty line found here
      if empty_line_count>1
        " this is a non-empty line after at least two empty lines in a row --> the next method!
        let found_previous_method=1
      else
        " not the beginning of the next method --> keep moving down
        let found_previous_method=MoveDown()
      endif

      " here we are on a non-empty line --> reset the empty line counter
      let empty_line_count=0
    endif
  endwhile
endfunction
