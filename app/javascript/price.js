function price () {
  const price = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener("input", () => {
    if (!price) {
      return false
    }
    
    const priceValue = price.value
    
    addTaxPrice.innerHTML = Math.floor(priceValue * 0.1)
    profit.innerHTML = Math.floor(priceValue * 0.9)
  })
}


window.addEventListener("turbo:load", price)