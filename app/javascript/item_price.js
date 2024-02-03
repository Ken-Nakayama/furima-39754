function updatePrice() {
  const priceInput = document.getElementById("item-price");
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = Math.floor(inputValue * 0.9);
}

document.addEventListener('turbo:load', () => {
  updatePrice();
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", updatePrice);
});

document.addEventListener('turbo:render', () => {
    updatePrice();
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", updatePrice);
});

