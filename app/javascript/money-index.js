function pullDown(){
  
  const pullDownButton = document.getElementById("money")
  const pullDownParents = document.getElementById("money-index")

  pullDownButton.addEventListener('click', function(){
    if (pullDownParents.getAttribute("style") == "display:block;"){
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
}

document.addEventListener("turbolinks:load", pullDown)