function pullDown(){
  
  const myComment = document.getElementById("mycomment")
  // const pullDownParent = document.querySelectorAll(".destroy-btn")
  const pullDownChild = document.querySelectorAll(".my")

  pullDownChild.forEach(function(list) {

  list.addEventListener('click', function(){
    const pullDownParent = document.getElementById("destroy")
    debugger
    if (pullDownParent.getAttribute("style") == "display:block;"){
      pullDownParent.removeAttribute("style", "display:block;")
    } else {
      pullDownParent.setAttribute("style", "display:block;")
    }
    
  })
  })
}

document.addEventListener("turbolinks:load", pullDown)