function load() {
  
  const submit_post = document.getElementById("submit_post")
  submit_post.addEventListener("click",(e)=>{
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/collects", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const collect = XHR.response.collect;
      const list = document.getElementById("list");
      const formText_1 = document.getElementById("content-1" );
      const formText_2 = document.getElementById("content-2");
      const HTML = `
      <div class="post-content">
          投稿日時：${collect.explanation}
      </div>
      <div class="post-content">
          投稿日時：${collect.language_id}
      </div>`;
      list.insertAdjacentHTML("beforebegin", HTML);
      formText_1.value = "";
      formText_2.value = "";
    };
    e.preventDefault();
  })
}
window.addEventListener("load", load);