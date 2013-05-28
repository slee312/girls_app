// Correct Facebook redirection annoyance
if (window.location.hash == "#_=_") {
  window.location.hash = "";
  history.pushState('', document.title, document.location.pathname);
  e.preventDefault();
}
