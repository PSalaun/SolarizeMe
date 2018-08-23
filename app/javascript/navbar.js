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

if (document.getElementById("cards-list")) {
  window.onscroll = function() {navbarSolidColorOnCards()};
}

// debugger;
