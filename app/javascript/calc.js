function calc() {
  const price = document.getElementById("item-price")
  this.addEventListener("keyup", function() {
    // 販売手数料のIDを取得
    const commissionArea = document.getElementById("add-tax-price")
    // 販売利益のIDを取得
    const profitArea =  document.getElementById("profit")
    // 販売手数料の定義（小数点切り捨て）
    const commissionPrice = Math.floor(price.value * 0.1)
    // 販売利益の定義
    const profitPrice = price.value - commissionPrice
    // 販売手数料の埋め込み
    commissionArea.innerHTML = commissionPrice
    // 販売利益の埋め込み
    profitArea.innerHTML = profitPrice
  });
};


window.addEventListener("load", calc);