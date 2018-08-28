function ScrollHandler(pageId) {
  var page = $('#' + pageId);
  var pageStart = page.offset().top;
  var pageJump = false;

  function scrollToPage() {
    pageJump = true;
    $('html, body').animate({
      scrollTop: pageStart
    }, {
      duration: 1000,
      complete: function() {
        pageJump = false;
      }
    });
  };

  window.addEventListener('wheel', function(event) {
   var viewStart = $(window).scrollTop();
   if (!pageJump) {
      const viewStart = window.scrollY;
      const pageStartPortion = page.height() / 10;
      const pageStopPortion = page.height() / 8;
      const scrollForward = event.deltaY > 0;
      const pageEndPart = (pageStart + page.height()) - viewStart;
      const canJumpDown = pageStartPart > pageStartPortion;
      const stopJumpDown = pageStartPart > pageStopPortion;
      const canJumpUp = pageEndPart > pageStartPortion;
      const stopJumpUp = pageEndPart > pageStopPortion;
      if (  ( scrollingForward && canJumpDown && !stopJumpDown)
         || (!scrollingForward && canJumpUp   && !stopJumpUp)) {
        scrollToPage();
      }
    }
  };
}
