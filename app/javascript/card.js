const pay = ()=>{
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    // フォーム送信後のフォームの情報を取得
    const formResult = document.getElementById("charge-form")
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
      cvc: formData.get("order[cvc]"),
    };

    // カード情報をPay.jp側に送り、トークン化
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value = ${token} name = 'token' type= "hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // クレジットカードの情報を削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      // フォームの情報をサーバーサイドに送信！
      document.getElementById("charge-form").submit();
    });
  });
};



window.addEventListener("load",pay)