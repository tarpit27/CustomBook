function showFriends(str) {
    if (str.trim() === "") {
        str = "..///,,,";
        var parent = document.getElementById("friends");
        var child = document.getElementById("friendsList");
        parent.removeChild(child);
    } else {
        var xh = new XMLHttpRequest();
        xh.onreadystatechange = function () {
            if (xh.readyState == 4 && xh.status == 200) {
                document.getElementById("friends").innerHTML = xh.responseText;
            }
        }
        xh.open("get", "find_friends.jsp?name=" + str, true);
        xh.send();
    }
}
function hideFriends() {
    alert("test");
    var parent = document.getElementById("friends");
    var child = document.getElementById("friendsList");
    parent.removeChild(child);
}
