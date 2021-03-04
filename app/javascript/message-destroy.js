function pullDown(){
  
  const myComment = document.querySelectorAll(".my")

  myComment.forEach(function(list) {

  list.addEventListener('click', function(){
    // const pullDownParent = document.getElementById("destroy")
    // if (pullDownParent.getAttribute("style") == "display:block;"){
    //   pullDownParent.removeAttribute("style", "display:block;")
    // } else {
    //   pullDownParent.setAttribute("style", "display:block;")
    // }
    const deleteButton = list.parentNode.querySelector(".delete-btn")
    deleteButton.classList.toggle("hidden")
    
  })
  })
}

document.addEventListener("turbolinks:load", pullDown)