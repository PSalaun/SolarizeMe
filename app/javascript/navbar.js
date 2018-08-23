function scrollNavbar() {
  if (document.body.scrollTop > 40 || document.documentElement.scrollTop > 40) {
    document.getElementById("navbar").style.top = "0";
    document.getElementById("navbar").classList.remove("hidden");
  }
}

if (window.location.pathname === "/") {
  window.onscroll = function() {scrollNavbar()};
} else {
  document.getElementById("navbar").classList.remove("hidden");
}
