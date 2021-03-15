function pullDown(){
  
  const myComment = document.querySelectorAll(".my")
  
  myComment.forEach((list) => {
    list.addEventListener("click", () => {
      const deleteButton = list.parentNode.querySelector(".delete-btn")
      if (deleteButton.classList.contains("hidden")) {
        const deleteButtons = document.querySelectorAll(".delete-btn")
        deleteButtons.forEach(button => button.classList.add("hidden") )
      }
      deleteButton.classList.toggle("hidden")
    })
  })

}

document.addEventListener("turbolinks:load", pullDown)
