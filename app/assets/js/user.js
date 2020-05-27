var xmlRequest
function createRequest() {
    if(window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP");
    } else if(window.XMLHttpRequest) {
        return new XMLHttpRequest();
    }
}

function responseHander() {
    if(xmlRequest.readyState == 4 && xmlRequest.status==200) {
        var msg = xmlRequest.responseText;
        alert(msg);
    }
    else{
        alert("no error");
    }
}

function ajaxTest() {
    xmlRequest = createRequest();
    xmlRequest.onreadystatechange=responseHander;
    var uname = document.getElementById("uname").value;
    xmlRequest.open("GET","http://127.0.0.1:3000/users/checkname?uname="+uname);
    alert("running test");
    xmlRequest.send(null);
}

function t_test() {
    ajaxTest();
}