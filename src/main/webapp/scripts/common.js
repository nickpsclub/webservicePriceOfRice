function commonChangeLanguage(language) {
    var url = window.location.href;
    if (url.indexOf("lang=") >= 0) {
        var prefix = url.substring(0, url.indexOf("lang"));
        var suffix = url.substring(url.indexOf("lang")).substring(url.indexOf("=") + 1);
        suffix = (suffix.indexOf("&") >= 0) ? suffix.substring(suffix.indexOf("&")) : "";
        url = prefix + "lang=" + language + suffix;
    } else {
        if (url.indexOf("?") < 0)
            url += "?" + "lang=" + language;
        else
            url += "&" + "lang=" + language;
    }
    window.location.href = url;
}