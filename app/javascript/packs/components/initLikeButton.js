console.log('ola');
console.log(document.querySelectorAll(".like-button"));
const initLikeButton = () => {
  if (document.querySelector(".like-button")){
    const list = document.querySelectorAll(".like-button").forEach((button) => {
      button.addEventListener("click", (event) => {
        console.log(event.currentTarget);
        if (event.currentTarget.text == 'like') {
          event.currentTarget.text = 'dislike';
        } else {
          event.currentTarget.text = 'like';
        }
        event.currentTarget.classList.toggle('btn-warning');
        event.currentTarget.classList.toggle('btn-success');
      });
    });
  }
}

export { initLikeButton };
