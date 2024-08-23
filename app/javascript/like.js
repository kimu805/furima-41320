function count() {
  const clickStar = document.querySelector(".click-star")

  if (!clickStar) return null
  
  clickStar.addEventListener("click", () => {
    const XHR = new XMLHttpRequest()
    XHR.open("POST", "")
  })
}

window.addEventListener("turbo:load", count)
window.addEventListener("turbo:render", count)