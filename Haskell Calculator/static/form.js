window.addEventListener("load", setup);
function setup(){
  var route;
  console.log("setup");

  function submitForm(e){
    console.log("begin submission");
    if (e.preventDefault) e.preventDefault();
    var op1 = document.getElementById('op1').value;
    var op2 = document.getElementById('op2').value;
    var index = document.getElementById("operator");
    var operator = index.options[index.selectedIndex].text;
    console.log(operator);
    switch(operator) {
      case '+':
        route = "/add/"+op1+"/"+op2;
        break;
      case '-':
        route = "/subtract/"+op1+"/"+op2;
        break;
      case '*':
        route = "/multiply/"+op1+"/"+op2;
        break;
      case '/':
        route = "/divide/"+op1+"/"+op2;
        break;
      default:
        throw new Error("Invalid Operator");
      }
    console.log("submission complete");
    window.location.assign("http://localhost:3000"+route);
    return false;
  }


  var form = document.getElementById('calcEntryForm');
  if (form.attachEvent) {
    form.attachEvent("submit", submitForm);
    console.log("attach Event");
  } else {
    form.addEventListener("submit", submitForm);
    console.log("add event listener");
  }
}
