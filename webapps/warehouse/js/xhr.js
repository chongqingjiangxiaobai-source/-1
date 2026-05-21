// 获得内置对象xhr
function getXHR(){
    var xhr = null;
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        try { xhr = new ActiveXObject('Microsoft.XMLHttp'); } catch (e) {}
        try { xhr = new ActiveXObject('Msxml2.XMLHttp'); } catch (e) {}
    }
    return xhr;
}
