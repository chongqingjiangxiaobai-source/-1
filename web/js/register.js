var flag_username = false;
var flag_pwd = false;
var flag_repwd = false;

window.onload = function () {

  // 1. 用户名失焦校验
  var usernameObj = document.getElementById("username");
  usernameObj.onblur = function () {
    var reg = /^[a-zA-Z][a-zA-Z0-9]{2,7}$/;
    var username = usernameObj.value;
    var span = document.getElementById("err-username");
    var parentGroup = usernameObj.closest(".m3-field-group");

    if (!username) {
      clearStatus(span, parentGroup);
      return;
    }

    if (!reg.test(username)) {
      applyInputStyle(span, parentGroup, "格式错误：3-8位且首字符须为字母", false);
      flag_username = false;
    } else {
      var xhr = getXHR();
      xhr.open('get', 'findByUsernameServlet?username=' + encodeURIComponent(username), true);
      xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
          var txtStr = JSON.parse(xhr.responseText);
          if (txtStr) {
            applyInputStyle(span, parentGroup, "check_circle 账号名可用", true);
            flag_username = true;
          } else {
            applyInputStyle(span, parentGroup, "账号名已被占用", false);
            flag_username = false;
          }
        }
      };
      xhr.send(null);
    }
  };

  // 2. 密码强度失焦校验
  var pwdObj = document.getElementsByName("password")[0];
  pwdObj.onblur = function () {
    var reg = /^[a-zA-Z0-9]{6,18}$/;
    var span = document.getElementById("err-pwd");
    var parentGroup = pwdObj.closest(".m3-field-group");

    if (!pwdObj.value) {
      clearStatus(span, parentGroup);
      return;
    }

    if (reg.test(pwdObj.value)) {
      applyInputStyle(span, parentGroup, "check_circle 密码格式合规", true);
      flag_pwd = true;
    } else {
      applyInputStyle(span, parentGroup, "格式错误：需6-18位数字或字母", false);
      flag_pwd = false;
    }

    if (document.getElementById("repassword").value) {
      document.getElementById("repassword").onblur();
    }
  };

  // 3. 密码二次一致性校验
  var repwdObj = document.getElementById("repassword");
  repwdObj.onblur = function () {
    var span = document.getElementById("err-repwd");
    var parentGroup = repwdObj.closest(".m3-field-group");

    if (!repwdObj.value) {
      clearStatus(span, parentGroup);
      return;
    }

    if (pwdObj.value === repwdObj.value) {
      applyInputStyle(span, parentGroup, "check_circle 两次密码输入一致", true);
      flag_repwd = true;
    } else {
      applyInputStyle(span, parentGroup, "两次输入的密码不一致", false);
      flag_repwd = false;
    }
  };

  // 4. 表单提交前拦截
  var myform = document.getElementById("regForm");
  myform.onsubmit = function (e) {
    if (flag_username && flag_pwd && flag_repwd) {
      e.preventDefault();
      var wrapper = document.getElementById("pageWrapper");
      if (wrapper) {
        wrapper.classList.add("exit-active");
        setTimeout(function () {
          myform.submit();
        }, 480);
      } else {
        myform.submit();
      }
      return true;
    } else {
      e.preventDefault();
      var card = document.querySelector(".glass-login-card");
      card.style.animation = "none";
      setTimeout(function () {
        card.style.animation = "shake 0.4s ease";
      }, 10);
      return false;
    }
  };
};

function applyInputStyle(span, group, message, isSuccess) {
  if (!span || !group) return;
  group.classList.remove("m3-valid-state", "m3-error-state");

  if (isSuccess) {
    group.classList.add("m3-valid-state");
    span.className = "err-tip success-state";
    span.innerHTML = message.replace("check_circle", "<span class='material-icons-outlined' style='font-size:14px;vertical-align:middle;margin-right:2px;'>check_circle</span>");
  } else {
    group.classList.add("m3-error-state");
    span.className = "err-tip error-state";
    var icon = message.indexOf("check_circle") === 0 ? "<span class='material-icons-outlined' style='font-size:14px;vertical-align:middle;margin-right:2px;'>error</span>" : "";
    span.innerHTML = icon + message;
  }
}

function clearStatus(span, group) {
  if (span) span.innerHTML = "";
  if (group) group.classList.remove("m3-valid-state", "m3-error-state");
}

function smoothNavigate(targetUrl) {
  if (!targetUrl || targetUrl === '#') return;
  var wrapper = document.getElementById("pageWrapper");
  if (wrapper) {
    wrapper.classList.add("exit-active");
    setTimeout(function () {
      window.location.href = targetUrl;
    }, 480);
  } else {
    window.location.href = targetUrl;
  }
}
