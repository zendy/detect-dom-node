define [], () ->
  insertListener = ( event ) ->
    if event.animationName is 'nodeInserted'
      console.warn 'Another node has been inserted! ', event, event.target

  document.addEventListener 'animationstart', insertListener, false
  document.addEventListener 'MSAnimationStart', insertListener, false
  document.addEventListener 'webkitAnimationStart', insertListener, false

  addMoreListItem = ( event ) ->
    event.preventDefault()
    event.stopPropagation()

    ul = document.getElementById 'js-list'
    ul.insertAdjacentHTML 'beforeEnd', '<li>Another li!</li>'

  btnAddMore = document.getElementById 'js-add-more'
  btnAddMore.addEventListener 'click', addMoreListItem, false

  ul = document.getElementById 'js-list'
  ul.classList.add 'js-animation'
