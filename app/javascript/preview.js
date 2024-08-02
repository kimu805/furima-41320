function preview() {
  // 商品の新規登録・編集フォームを取得。
  const itemForm = document.getElementsByClassName("item_form")

  // プレビューを取得するためのスペースを取得
  const previewList = document.getElementById("previews")

  // フォームがない場合、ここで終了
  if (itemForm.length == 0) return null

  // input要素を取得
  const fileField = document.querySelector("input[type='file'][name='item[image]']")

  fileField.addEventListener("change", (e) => {

    const alreadyPreview = document.querySelector(".preview")
    if (alreadyPreview) {
      alreadyPreview.remove()
    }
    
    const file = e.target.files[0]
    const blob = window.URL.createObjectURL(file)
    
    // div要素を生成
    const previewWrapper = document.createElement("div")
    previewWrapper.setAttribute("class", "preview")

    // img要素を生成
    const previewImage = document.createElement("img")
    previewImage.setAttribute("class", "preview-image")
    previewImage.setAttribute("src", blob)
    previewImage.setAttribute("width", "193")
    previewImage.setAttribute("height", "130")

    // 生成したHTMLの要素をブラウザに表示
    previewWrapper.appendChild(previewImage)
    previewList.appendChild(previewWrapper)
  })

}

window.addEventListener("turbo:load", preview)
window.addEventListener("turbo:render", preview)