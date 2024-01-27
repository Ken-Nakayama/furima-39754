var priceInput = document.getElementById('item-price');
var addTaxPriceElement = document.getElementById('add-tax-price');
var profitElement = document.getElementById('profit');

priceInput.addEventListener('input', () => {
  // 入力された価格を取得
  var price = parseFloat(priceInput.value);

  // 入力が数値でない場合や範囲外の場合は処理しない
  if (isNaN(price) || price < 300 || price > 9999999) {
    addTaxPriceElement.textContent = '0';
    profitElement.textContent = '0';
    return;
  }

  // 販売手数料の計算（10%）
  var addTaxPrice = Math.floor(price * 0.1);

  // 販売利益の計算
  var profit = price - addTaxPrice;

  // 結果を表示
  addTaxPriceElement.textContent = addTaxPrice.toLocaleString(); // 3桁ごとにカンマを表示
  profitElement.textContent = profit.toLocaleString(); // 3桁ごとにカンマを表示
})