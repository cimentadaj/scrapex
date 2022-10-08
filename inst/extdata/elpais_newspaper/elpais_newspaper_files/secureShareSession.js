// Share session
var usumShareSession = 'https://services.users.elpais.com/serviceLogin.html';

var cookiesToPasteValue = ["ArcId.USER_INFO"];

/* Get localStorage setItem prototype function*/
var _setItem = Storage.prototype.setItem;

Storage.prototype.setItem = function(key, value) {
	if (cookiesToPasteValue.includes(key)) {
		updateCookie(key, value);
	}
	_setItem.apply(localStorage, [key, value]);
}

function updateCookie(key, value) {
	var date = new Date();
	date.setDate(date.getDate() + 365);

	var cookieNameValue = [key, btoa(value)].join("=");
	var expires = ["expires", date].join("=");
	var domain = ["domain", ".elpais.com"].join("=");
	
	document.cookie = [cookieNameValue, expires, domain, "path=/", "samesite=none", "Secure"].join(";");
}

function deleteCookie(name) {
  document.cookie = name + '=;Path=/;domain=.elpais.com;Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

// When window load...
(function() {
	
	/* Share session with usum */
	
	/* To get cookies by name */
	function getCookieByName(name) {
		var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
		return match ? match[2] : undefined;
	}

	
	/* Paste cookies values in localStorage */
	for (var cookie in cookiesToPasteValue) {
		
		var cookieName = cookiesToPasteValue[cookie];
		var value = getCookieByName(cookieName);

		if (value) {
			_setItem.apply(localStorage, [cookieName, atob(value)]);
		} else {
			//localStorage.removeItem(cookiesToPasteValue[cookie]);
		}
		
	}
	
	/* To share session */
	function spreadSession() {
		
		// First checkout if cookie exists
		var cookieUSUM = getCookieByName("uid_ns");
		var tokenARC = localStorage.getItem("ArcId.USER_INFO");
		
		// If not exists, get tokenARC and spread session
		if ((!cookieUSUM || cookieUSUM.split("#").filter(x => x.trim() !== "").length === 1) && tokenARC && JSON.parse(tokenARC).accessToken) {
						
			var xhr = new XMLHttpRequest();
			
			var body = JSON.stringify({ 'tokenARC': JSON.parse(tokenARC).accessToken });
			
			// Callback
			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					//console.log("Cookies setted");
					// Dispatch event 'oncookiessetted' to inform that cookies are setted
					var e = document.createEvent('HTMLEvents');
					e.initEvent('oncookiessetted', true, true);
					document.dispatchEvent(e);
				}
			};
			
			// Open post request
			xhr.open("POST", usumShareSession, true);
			xhr.setRequestHeader('Content-type', 'application/json');
			
			// Put extra data over request
			xhr.withCredentials = true;
			xhr.responseType = "document";
			
			// Send request
			xhr.send(body);
			
		} else {
			
			// if cookies already setted, dispatch 'cookiesalreadysetted' event
			//console.log("Cookies already setted");
			var e = document.createEvent('HTMLEvents');
			e.initEvent('cookiesalreadysetted', true, true);
			document.dispatchEvent(e);
			
		}
		
	}
		
	/* Delete old cookie */
	deleteCookie("P.USER_INFO");
	
	/* Try to share session with usum */
	spreadSession();
		
})();