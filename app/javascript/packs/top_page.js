function load() {
  
  const submit_post = document.getElementById("submit_post")
  submit_post.addEventListener("click",(e)=>{
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest(formData);
    XHR.open("POST", "/collects", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const collect = XHR.response.collect;
      if (collect.explanation === "" || collect.language_id === "" || collect.goal_id === "" ||collect.type_id === "" || collect.framework_id === ""){
        alert(`空の項目があります。必ず入力してください`);
        return null;
      }
      const list = document.getElementById("list");
      const formText_1 = document.getElementById("content-1" );
      const formText_2 = document.getElementById("content-2");
      const formText_3 = document.getElementById("content-3");
      const formText_4 = document.getElementById("content-4");
      const formText_5 = document.getElementById("content-5");

      const language = XHR.response.language;
      const type = XHR.response.type;
      const framework = XHR.response.framework;
      const collect_id = XHR.response.collect_id;
      
      const HTML = `
      <div class = 'post'>
      <div class="post-date">
        投稿日時：${collect.created_at}
      </div>
      <div class="post-content">
          募集要項：${collect.explanation}
      </div>
      <div class="post-content">
          求めるエンジニアの種類：${type}
      </div>
      <div class="post-content">
      開発フレームワーク${framework}
      </div>
      <div class="post-content">
          言語：${language}
      </div>
      <a href="/collects/${collect_id}">詳細画面</a>
      </div>`;
      
      list.insertAdjacentHTML("beforebegin", HTML);
      formText_1.value = "";
      formText_2.value = "";
      formText_3.value = "";
      formText_4.value = "";
      formText_5.value = "";
    };
    e.preventDefault();
  })
}
window.addEventListener("load", load);