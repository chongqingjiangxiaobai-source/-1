function mylogin() {
    var username = document.getElementById("username");
    var pwd = document.getElementById("password");
    if (!username || !pwd) {
        document.getElementById("err-login").innerText = "表单元素加载异常，请刷新重试";
        return;
    }
    var xhr = getXHR();
    if (!xhr) {
        document.getElementById("err-login").innerText = "浏览器不支持ajax，请使用现代浏览器";
        return;
    }
    xhr.open('get', 'loginServlet?username=' + encodeURIComponent(username.value) + '&pwd=' + encodeURIComponent(pwd.value), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var flag = JSON.parse(xhr.responseText);
            if (flag) {
                window.location.href = "home_page.jsp";
            } else {
                var span = document.getElementById("err-login");
                if (span) { span.innerText = "管理员账号或者密码错误"; }
            }
        }
    };
    xhr.send(null);
}
