const pay = () => {
  Payjp.setPublicKey("sk_test_4773201a0e7a94be6784b7b1"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form"); // charge-formというIDでフォームの情報を取得、FormDateオブジェクトとして生成
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy[number]"),
      cvc: formData.get("buy[cvc]"),
      exp_month: formData.get("buy[exp_month]"),
      exp_year: `20${formData.get("buy[exp_year]")}`,
    };
    console.log(card);

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
    
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);