function pullDown(){

  const pullDownButton = document.getElementById("lists")
  const celebIndex = document.getElementById("celeb-index")
  const pullDownParents = document.getElementById("pull-down")

  pullDownButton.addEventListener('mouseover', function(){
    celebIndex.setAttribute("style", "color: blue;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    celebIndex.removeAttribute("style", "color: blue;")
  })

  pullDownButton.addEventListener('click', function(){
    if (pullDownParents.getAttribute("style") == "display:block;"){
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
}

window.addEventListener("load", pullDown)