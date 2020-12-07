function method() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    if (
      Number.isInteger(Number(priceInput.value)) &&
      Number(priceInput.value) >= 300 &&
      Number(priceInput.value) <= 9999999
    ) {
      const price = priceInput.value;
      addTaxDom.innerHTML = Math.floor(price * 0.1);
      profit.innerHTML = price - Math.floor(price * 0.1);
    } else {
      addTaxDom.innerHTML = "";
      profit.innerHTML = "";
    }
  });
}

window.addEventListener("load", method);
