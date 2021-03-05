function pullDown(){
  
  const myComment = document.querySelectorAll(".my")

  myComment.forEach(function(list) {

  list.addEventListener('click', function(){
    
    // if(list.parentNode.querySelector(".hidden") == null){
      const deleteButtons = document.querySelectorAll(".delete-btn")
      deleteButtons.forEach(button => button.classList.add("hidden") )
    // }
    const deleteButton = list.parentNode.querySelector(".delete-btn")
    deleteButton.classList.toggle("hidden")
    
  })
  })
}

document.addEventListener("turbolinks:load", pullDown)


