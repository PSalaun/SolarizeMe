debugger;
const navbar = document.getElementById("navbar");

function scrollNavbar() {
  if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
    document.getElementById("navbar").style.top = "0";
    document.getElementById("navbar").classList.add("is-visible");
  }
}

function hideNavbarOnHomeTop() {
  document.getElementById("navbar").classList.add("navbar-toggle-content");
  document.querySelector(".yielded-content").style.paddingTop = "0px";
}

function navbarSolidColorOnCards() {
  const scrollPos = $(document).scrollTop();
  const cardsListPosition = $('#cards-list').offset().top;
  if (scrollPos > cardsListPosition) {
    navbar.style.background-color = black;
    navbar.style.color = white;
  }
}

// EVENTS
if (window.location.pathname === "/") {
  hideNavbarOnHomeTop();
  window.onscroll = function() {scrollNavbar()};
}
if (document.getElementById("cards-list")) {
  navbarSolidColorOnCards();
}
