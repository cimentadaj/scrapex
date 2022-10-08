(async function() {
  try {
    if (!document.head) {
      return;
    }
    const tokenElement = document.createElement('meta');
    tokenElement.httpEquiv = 'origin-trial';
    tokenElement.content = "A8v6UBRWDFGfDr4Z+AaQ3Ualvy6GNQp1i6Bhty2y8utDB45ZgfuIJnSRdPh2N84Q/dAQH6KL1/R2VCU6ucwwOw0AAACBeyJvcmlnaW4iOiJodHRwczovL3dlYm9yYW1hLmZyOjQ0MyIsImZlYXR1cmUiOiJQcml2YWN5U2FuZGJveEFkc0FQSXMiLCJleHBpcnkiOjE2Njk3NjYzOTksImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9";
    document.head.appendChild(tokenElement);

    if (!'browsingTopics' in document || !document.featurePolicy || !document.featurePolicy.allowsFeature('browsing-topics')) {
      return;
    }

    const topics = await document.browsingTopics();
    var dst = '', pu = '', tpcs = encodeURIComponent(JSON.stringify(topics)), xhr = new XMLHttpRequest();
    if (document.location) {
      pu = encodeURIComponent(document.location);
    }
    dst = 'https://cs.frontend.weborama.fr/tpcs?t='+tpcs+'&pu='+pu;
    xhr.open('GET', dst, true);
    xhr.withCredentials = true;
    xhr.send();
  } catch (e) {}
})();
