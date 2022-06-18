function clipboard_copy(element) {
  /* Get the text field */
  // var copyText = document.getElementById("myInput");

  /* Select the text field */
  // element.select();
  // element.setSelectionRange(0, 99999); /* For mobile devices */

  /* Copy the text inside the text field */
  navigator.clipboard.writeText(element.dataset.clipboardCopy);

  /* Alert the copied text */
  alert("Copied the text: " + element.dataset.clipboardCopy);
}

window.addEventListener("load", () => {
  const links = window.document.querySelectorAll("a[data-clipboard-copy]");

  links.forEach((element) => {
    element.addEventListener("click", (event) => {
      event.preventDefault();
      clipboard_copy(element);
    })
  })
})