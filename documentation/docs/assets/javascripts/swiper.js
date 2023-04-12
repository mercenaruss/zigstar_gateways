var swiper = new Swiper(".stick", {
		direction: "horizontal",
        slidesPerView: 1,
		spaceBetween: 30,
		loop: true,
		effect: "fade",
        centeredSlides: true,
        autoplay: {
          delay: 3500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
		scrollbar: {
			el: '.swiper-scrollbar',
		},
      });