$(function() {
	//지역 선택
	$("#academyGuAddress").change(function() {
		const selectedGu = $(this).val();
		const dongList = guAndDong[selectedGu];

		$("#academyDongAddress").empty();

		$.each(dongList, function(index, dong) {
			$("#academyDongAddress").append($("<option>", {
				value: dong,
				text: dong
			}));
		});
	});

	const guAndDong = {
		'강남구': ['개포동', '논현동', '대치동', '도곡동', '삼성동', '세곡동', '수서동', '신사동', '압구정동', '역삼동', '율현동', '일원동', '자곡동', '청담동'],
		'강동구': ['강일동', '고덕동', '길동', '둔촌동', '명일동', '상일동', '성내동', '암사동', '천호동'],
		'강북구': ['미아동', '번동', '수유동', '우이동'],
		'강서구': ['가양동', '개화동', '공항동', '과해동', '내발산동', '등촌동', '마곡동', '방화동', '염창동', '오곡동', '오쇠동', '외발산동', '화곡동'],
		'관악구': ['남현동', '봉천동', '신림동'],
		'광진구': ['광장동', '구의동', '군자동', '능동', '자양동', '중곡동', '화양동'],
		'구로구': ['가리봉동', '개봉동', '고척동', '구로동', '궁동', '신도림동', '오류동', '온수동', '천왕동', '항동'],
		'금천구': ['가산동', '독산동', '시흥동'],
		'노원구': ['공릉동', '상계동', '월계동', '중계동', '하계동'],
		'도봉구': ['도봉동', '방학동', '쌍문동', '창동'],
		'동대문구': ['답십리동', '신설동', '용두동', '이문동', '장안동', '전농동', '제기동', '청량리동', '회기동', '휘경동'],
		'동작구': ['노량진동', '대방동', '동작동', '본동', '사당동', '상도동', '신대방동', '흑석동'],
		'마포구': ['공덕동', '구수동', '노고산동', '당인동', '대흥동', '도화동', '동교동', '마포동', '망원동', '상수동', '상암동', '서교동', '성산동', '신공덕동', '신수동', '신정동', '아현동', '연남동', '염리동', '용강동', '중동', '창전동', '토정동', '하중동', '합정동', '현석동'],
		'서대문구': ['남가좌동', '냉천동', '대신동', '대현동', '미근동', '봉원동', '북가좌동', '북아현동', '신촌동', '연희동', '영천동', '옥천동', '창천동', '천연동', '충정로', '합동', '현저동', '홍은동', '홍제동'],
		'서초구': ['내곡동', '반포동', '방배동', '서초동', '신원동', '양재동', '염곡동', '우면동', '원지동', '잠원동'],
		'성동구': ['금호동', '도선동', '마장동', '사근동', '상왕십리동', '성수동', '송정동', '옥수동', '용답동', '응봉동', '하왕십리동', '행당동', '홍익동'],
		'성북구': ['길음동', '돈암동', '동선동', '동소문동', '보문동', '삼선동', '상월곡동', '석관동', '성북동', '안암동', '장위동', '정릉동', '종암동', '하월곡동'],
		'송파구': ['잠실동', '신천동', '풍납동', '송파동', '석촌동', '삼전동', '가락동', '문정동', '장지동', '방이동', '오금동', '거여동', '마천동'],
		'양천구': ['목동', '신월동', '신정동'],
		'영등포구': ['당산동', '대림동', '도림동', '문래동', '신길동', '양평동', '양화동', '여의도동', '영등포동'],
		'용산구': ['갈월동', '남영동', '도원동', '동빙고동', '동자동', '문배동', '보광동', '서계동', '서빙고동', '신계동', '용문동', '용산동', '원효로', '이촌동', '이태원동', '주성동', '청파동', '한강로', '한남동', '효창동', '후암동'],
		'은평구': ['갈현동', '구산동', '녹번동', '대조동', '불광동', '수색동', '신사동', '역촌동', '응암동', '증산동', '진관동'],
		'종로구' : ['가회동', '견지동', '경운동', '계동', '공평동', '관수동', '관철동', '관훈동', '교남동', '교북동', '구기동', '궁정동', '권농동', '낙원동', '내수동', '내자동', '누상동', '하동', '당주동', '도렴동', '돈의동', '동숭동', '명륜', '묘동', '무악동', '봉익동', '부암동', '사간동', '사직동', '삼청동', '서린동', '세종로', '소격동', '송월동', '송현동', '수송동', '숭인동', '신교동', '신문로', '신영동', '안국동', '연건동', '연지동', '예지동', '옥인동', '와룡동', '운니동', '원남동', '원서동', '이화동', '익선동', '인사동', '인의동', '장사동', '재동', '적선동', '종로', '중학동', '창성동', '창신동', '청운동', '청진동', '체부동', '충신동', '통의동', '통인동', '팔판동', '평동', '평창동', '필운동', '행촌동', '혜화동', '홍지동', '홍파동', '화동', '효자동', '효제동', '훈정동'],
		'중구': ['광희동', '남대문로', '남산동', '남창동', '남학동', '다동', '만리동', '명동', '무교동', '무학동', '묵정동', '방산동', '봉래동', '북창동', '산림동', '삼각동', '서소문동', '소공동', '수표동', '수하동', '순화동', '신당동', '쌍림동', '예관동', '예장동', '오장동', '을지로', '의주로', '인현동', '입정동', '장교동', '장충동', '저동', '정동', '주교동', '주자동', '중림동', '초동', '충무로', '충정로', '태평로', '필동', '황학동', '회현동', '흥인동'],
		'중랑구': ['면목동', '망우동', '묵동', '상봉동', '신내동', '중화동']
	}

	$("#mainSearchBtn").click(function() {
		submitForm();
	});
	
	$("mainSearchForm").keydown(function(event) {
		if(event.keyCode == 13) {
			event.preventDefault();
			submitForm();
		}
	});
	
	function submitForm() {
		if (!chkData("#academyGuAddress", "검색할 지역을 ")) return;
		else if (!chkData("#academyCurriculumName", "과목")) return;
		else {
			$("#mainSearchForm").attr({
				"method": "post",
				"action": "/mainSearchList"
			})
			$("#mainSearchForm").submit();
		}
	}
});
(function() {
	"use strict";

	/**
	 * Easy selector helper function
	 */
	const select = (el, all = false) => {
		el = el.trim()
		if (all) {
			return [...document.querySelectorAll(el)]
		} else {
			return document.querySelector(el)
		}
	}

	/**
	 * Easy event listener function
	 */
	const on = (type, el, listener, all = false) => {
		let selectEl = select(el, all)
		if (selectEl) {
			if (all) {
				selectEl.forEach(e => e.addEventListener(type, listener))
			} else {
				selectEl.addEventListener(type, listener)
			}
		}
	}

	/**
	 * Easy on scroll event listener 
	 */
	const onscroll = (el, listener) => {
		el.addEventListener('scroll', listener)
	}

	/**
	 * Navbar links active state on scroll
	 */
	let navbarlinks = select('#navbar .scrollto', true)
	const navbarlinksActive = () => {
		let position = window.scrollY + 200
		navbarlinks.forEach(navbarlink => {
			if (!navbarlink.hash) return
			let section = select(navbarlink.hash)
			if (!section) return
			if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
				navbarlink.classList.add('active')
			} else {
				navbarlink.classList.remove('active')
			}
		})
	}
	window.addEventListener('load', navbarlinksActive)
	onscroll(document, navbarlinksActive)

	/**
	 * Scrolls to an element with header offset
	 */
	const scrollto = (el) => {
		let header = select('#header')
		let offset = header.offsetHeight

		let elementPos = select(el).offsetTop
		window.scrollTo({
			top: elementPos - offset,
			behavior: 'smooth'
		})
	}

	/**
	 * Toggle .header-scrolled class to #header when page is scrolled
	 */
	let selectHeader = select('#header')
	if (selectHeader) {
		const headerScrolled = () => {
			if (window.scrollY > 100) {
				selectHeader.classList.add('header-scrolled')
			} else {
				selectHeader.classList.remove('header-scrolled')
			}
		}
		window.addEventListener('load', headerScrolled)
		onscroll(document, headerScrolled)
	}

	/**
	 * Back to top button
	 */
	let backtotop = select('.back-to-top')
	if (backtotop) {
		const toggleBacktotop = () => {
			if (window.scrollY > 100) {
				backtotop.classList.add('active')
			} else {
				backtotop.classList.remove('active')
			}
		}
		window.addEventListener('load', toggleBacktotop)
		onscroll(document, toggleBacktotop)
	}

	/**
	 * Mobile nav toggle
	 */
	on('click', '.mobile-nav-toggle', function(e) {
		select('#navbar').classList.toggle('navbar-mobile')
		this.classList.toggle('bi-list')
		this.classList.toggle('bi-x')
	})

	/**
	 * Mobile nav dropdowns activate
	 */
	on('click', '.navbar .dropdown > a', function(e) {
		if (select('#navbar').classList.contains('navbar-mobile')) {
			e.preventDefault()
			this.nextElementSibling.classList.toggle('dropdown-active')
		}
	}, true)

	/**
	 * Scrool with ofset on links with a class name .scrollto
	 */
	on('click', '.scrollto', function(e) {
		if (select(this.hash)) {
			e.preventDefault()

			let navbar = select('#navbar')
			if (navbar.classList.contains('navbar-mobile')) {
				navbar.classList.remove('navbar-mobile')
				let navbarToggle = select('.mobile-nav-toggle')
				navbarToggle.classList.toggle('bi-list')
				navbarToggle.classList.toggle('bi-x')
			}
			scrollto(this.hash)
		}
	}, true)

	/**
	 * Scroll with ofset on page load with hash links in the url
	 */
	window.addEventListener('load', () => {
		if (window.location.hash) {
			if (select(window.location.hash)) {
				scrollto(window.location.hash)
			}
		}
	});

	/**
	 * Preloader
	 */
	let preloader = select('#preloader');
	if (preloader) {
		window.addEventListener('load', () => {
			preloader.remove()
		});
	}

	/**
	 * Initiate  glightbox 
	 */
	const glightbox = GLightbox({
		selector: '.glightbox'
	});

	/**
	 * Skills animation
	 */
	let skilsContent = select('.skills-content');
	if (skilsContent) {
		new Waypoint({
			element: skilsContent,
			offset: '80%',
			handler: function(direction) {
				let progress = select('.progress .progress-bar', true);
				progress.forEach((el) => {
					el.style.width = el.getAttribute('aria-valuenow') + '%'
				});
			}
		})
	}

	/**
	 * Porfolio isotope and filter
	 */
	window.addEventListener('load', () => {
		let portfolioContainer = select('.portfolio-container');
		if (portfolioContainer) {
			let portfolioIsotope = new Isotope(portfolioContainer, {
				itemSelector: '.portfolio-item'
			});

			let portfolioFilters = select('#portfolio-flters li', true);

			on('click', '#portfolio-flters li', function(e) {
				e.preventDefault();
				portfolioFilters.forEach(function(el) {
					el.classList.remove('filter-active');
				});
				this.classList.add('filter-active');

				portfolioIsotope.arrange({
					filter: this.getAttribute('data-filter')
				});
				portfolioIsotope.on('arrangeComplete', function() {
					AOS.refresh()
				});
			}, true);
		}

	});

	/**
	 * Initiate portfolio lightbox 
	 */
	const portfolioLightbox = GLightbox({
		selector: '.portfolio-lightbox'
	});

	/**
	 * Portfolio details slider
	 */
	new Swiper('.portfolio-details-slider', {
		speed: 400,
		loop: true,
		autoplay: {
			delay: 5000,
			disableOnInteraction: false
		},
		pagination: {
			el: '.swiper-pagination',
			type: 'bullets',
			clickable: true
		}
	});

	/**
	 * Animation on scroll
	 */
	window.addEventListener('load', () => {
		AOS.init({
			duration: 1000,
			easing: "ease-in-out",
			once: true,
			mirror: false
		});
	});

})()