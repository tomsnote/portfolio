$(document).ready(function(){
    post($("#post1"),$(".post1"));  
    post($("#post2"),$(".post2"));   
    
    $("#login")
})
function post($obj1,$obj2){
    $obj1.click(function(){
        if($obj2.css("display") == "none"){
            $obj2.css("display", "block");   
        } else {
            $obj2.css("display", "none");
        }
    })
}
function openNav() {
document.getElementById("sideNavigation").style.width = "250px";
// document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
document.getElementById("sideNavigation").style.width = "0";
// document.getElementById("main").style.marginLeft = "0";
}