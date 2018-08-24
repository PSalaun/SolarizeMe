const navbar = document.getElementById("navbar");

function scrollNavbar() {
  if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
    navbar.style.top = "0";
    navbar.classList.add("is-visible");
  }
}

function hideNavbarOnHomeTop() {
  navbar.classList.add("navbar-toggle-content");
  document.querySelector(".yielded-content").style.paddingTop = "0px";
}

function navbarSolidColorOnCards() {
  const scrollPos = $(document).scrollTop();
  const cardsListPosition = $('#js-cards-list').offset().top;
  if (scrollPos > cardsListPosition) {
    navbar.classList.toggle("navbar-dark-background", true);
  } else {
    navbar.classList.toggle("navbar-dark-background", false);
  }
}

// EVENTS
if (window.location.pathname === "/") {
  hideNavbarOnHomeTop();
  window.onscroll = function() {scrollNavbar()};
}

if (document.getElementById("js-cards-list")) {
  window.onscroll = function() {navbarSolidColorOnCards()};
}

