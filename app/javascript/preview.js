function preview() {
  // 商品の新規登録・編集フォームを取得。
  const itemForm = document.getElementsByClassName("item_form")

  // プレビューを取得するためのスペースを取得
  const previewList = document.getElementById("previews")

  // フォームがない場合、ここで終了
  if (itemForm.length == 0) return null

  // ブレぴゅー画像を生成・表示する関数
  const buildPreviewImage = (dataIndex, blob) => {
    // div要素を生成
    const previewWrapper = document.createElement("div")
    previewWrapper.setAttribute("class", "preview")
    previewWrapper.setAttribute("data-index", dataIndex)

    // img要素を生成
    const previewImage = document.createElement("img")
    previewImage.setAttribute("class", "preview-image")
    previewImage.setAttribute("src", blob)
    previewImage.setAttribute("width", "193")
    previewImage.setAttribute("height", "130")

    // 生成したHTMLの要素をブラウザに表示
    previewWrapper.appendChild(previewImage)
    previewList.appendChild(previewWrapper)
  }

  // ファイル選択ボタンを生成・表示する関数
  const buildNewFileField = () => {
    
    // 2枚目用ファイル選択ボタンを作成
    const newFileField = document.createElement("input")
    newFileField.setAttribute("type", "file")
    newFileField.setAttribute("name", "item[images][]")

    // 最後のファイル選択ボタンを取得
    const lastFileField = document.querySelector('input[type="file"][name="item[images][]"]:last-child')
    // nextDataIndex = 最後のファイル選択ボタンのdeta-index + 1
    const nextDataIndex = Number(lastFileField.getAttribute("data-index")) + 1
    newFileField.setAttribute("data-index", nextDataIndex)

    // 追加されたファイル選択ボタンにchangeイベントをセット
    newFileField.addEventListener("change", changedFileField)

    // 生成したファイル選択ボタンを表示
    const fileFieldsArea = document.querySelector(".click-upload")
    fileFieldsArea.appendChild(newFileField)
  }

  // 指定したdata-indexを持つプレビューとファイル選択ボタンを削除する。
  const deleteImage = (dataIndex) => {
    const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`)
    deletePreviewImage.remove()
    const deleteFileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`)
    deleteFileField.remove()
  }

  // input要素で値の変化が起きた際に呼び出される関数の中身
  const changedFileField = (e) => {
    
    // data-index（何番目を操作しているか）を取得
    const dataIndex = e.target.getAttribute("data-index")

    
    const file = e.target.files[0]

    if (!file) {
      deleteImage(dataIndex)
      return null
    }
    const blob = window.URL.createObjectURL(file)

    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`)

    if (alreadyPreview) {
      const alreadyPreviewImage = alreadyPreview.querySelector("img")
      alreadyPreviewImage.setAttribute("src", blob)
      return null
    }

    buildPreviewImage(dataIndex, blob)
    buildNewFileField()
   
  }

  // input要素を取得
  const fileField = document.querySelector("input[type='file'][name='item[images][]']")

  fileField.addEventListener("change", changedFileField)
}

window.addEventListener("turbo:load", preview)
window.addEventListener("turbo:render", preview)