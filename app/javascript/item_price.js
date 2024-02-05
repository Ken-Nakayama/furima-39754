function updatePrice() {
  const priceInput = document.getElementById("item-price");
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  const taxValue = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = taxValue;

  const addProfitDom = document.getElementById("profit");
  const profitValue = Math.floor(inputValue - taxValue);
  addProfitDom.innerHTML = profitValue;
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

