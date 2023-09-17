
let inputCheck = (input) => {
  if (isEmpty(input)) {
    return false;
  }
  return true;
};
let isEmpty =  (str) => {
  if (typeof str == "undefined" || str == null || str == "") return true;
  else return false;
}

const memberSignInBtn = document.getElementById("memberSignIn");
const memberSignUpBtn = document.getElementById("memberSignUp");
const container = document.querySelector(".container");
if (!isEmpty(memberSignInBtn)) {
  memberSignInBtn.addEventListener("click", () => {
    container.classList.remove("right-panel-active");
  });
}
if (!isEmpty(memberSignUpBtn)) {
  memberSignUpBtn.addEventListener("click", () => {
    container.classList.add("right-panel-active");
  });
}
