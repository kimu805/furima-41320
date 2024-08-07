function price () {
  const itemForm = document.getElementsByClassName("item_form")
  
  if (itemForm.length == 0) return null

  const price = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener("input", () => {
    
    const priceValue = price.value
    
    addTaxPrice.innerHTML = Math.floor(priceValue * 0.1)
    profit.innerHTML = Math.floor(priceValue * 0.9)
  })
}


window.addEventListener("turbo:load", price)
window.addEventListener("turbo:render", price)