const navbar = document.getElementById("navbar");

function scrollNavbar() {
  if (document.body.scrollTop > 400 || document.documentElement.scrollTop > 400) {
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
    navbar.classList.add("navbar-dark-background");
  } else {
    navbar.classList.remove("navbar-dark-background");
  }
}

function homePageNavbarDisplay() {
  scrollNavbar();
  navbarSolidColorOnCards();
}

// EVENTS
if (window.location.pathname === "/") {
  hideNavbarOnHomeTop();
  window.onscroll = function() {homePageNavbarDisplay()};
} else {
  if (document.getElementById("js-cards-list")) {
  window.onscroll = function() {navbarSolidColorOnCards()};
  }
}



