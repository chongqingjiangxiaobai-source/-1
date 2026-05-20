function mylogin() {
  var username = document.getElementById("username");
  var pwd = document.getElementById("password");
  var errSpan = document.getElementById("err-login");
  var card = document.querySelector(".glass-login-card");

  if (!username || !pwd) {
    if (errSpan) errSpan.innerText = "表单元素加载异常，请刷新重试";
    return;
  }
  if (errSpan) errSpan.innerText = "";

  var xhr = getXHR();
  if (!xhr) {
    if (errSpan) errSpan.innerText = "浏览器不支持 AJAX，请使用现代浏览器";
    return;
  }

  var loginBtn = document.getElementById("loginBtn");
  if (loginBtn) {
    loginBtn.style.pointerEvents = "none";
    loginBtn.style.opacity = "0.7";
    var btnText = loginBtn.querySelector(".btn-text");
    if (btnText) btnText.innerText = "验证中...";
  }

  xhr.open('get', 'loginServlet?username=' + encodeURIComponent(username.value) + '&pwd=' + encodeURIComponent(pwd.value), true);
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (loginBtn) {
        loginBtn.style.pointerEvents = "auto";
        loginBtn.style.opacity = "1";
        var btnText = loginBtn.querySelector(".btn-text");
        if (btnText) btnText.innerText = "登 录";
      }
      if (xhr.status == 200) {
        var flag = JSON.parse(xhr.responseText);
        if (flag) {
          smoothNavigate("home_page.jsp");
        } else {
          if (errSpan) errSpan.innerText = "管理员账号或者密码错误";
          card.style.animation = "none";
          setTimeout(function() { card.style.animation = "shake 0.4s ease"; }, 10);
        }
      } else {
        if (errSpan) errSpan.innerText = "服务器通信异常 (" + xhr.status + ")";
      }
    }
  };
  xhr.send(null);
}

function smoothNavigate(targetUrl) {
  if (!targetUrl || targetUrl === '#') return;
  var wrapper = document.getElementById("pageWrapper");
  if (wrapper) {
    wrapper.classList.add("exit-active");
    setTimeout(function() { window.location.href = targetUrl; }, 480);
  } else {
    window.location.href = targetUrl;
  }
}
