
/* menu right */
function openNav() {
    document.getElementById("mySidenav").style.width = "40%";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

/* Lập trình ứng dụng di động đa nền tảng */
var i = 0;
function one() {
    if (i == 0) {
        i = 1;
        var elem = document.getElementById("myBar");
        var width = 1;
        var id = setInterval(frame, 10);
        function frame() {
            if (width >= 100) {
                clearInterval(id);
                i = 0;
            } else {
                width++;
                elem.style.width = width + "%";
            }
        }
    }
}

/* thiết kế web chuyên nghiệp */
var i = 0;
function two() {
    if (i == 0) {
        i = 1;
        var elem = document.getElementById("myBarr");
        var width = 1;
        var id = setInterval(frame, 10);
        function frame() {
            if (width >= 100) {
                clearInterval(id);
                i = 0;
            } else {
                width++;
                elem.style.width = width + "%";
            }
        }
    }
}

/* dịch vụ IT service */
var i = 0;
function three() {
    if (i == 0) {
        i = 1;
        var elem = document.getElementById("myBarrr");
        var width = 1;
        var id = setInterval(frame, 10);
        function frame() {
            if (width >= 100) {
                clearInterval(id);
                i = 0;
            } else {
                width++;
                elem.style.width = width + "%";
            }
        }
    }
}

/* cung cấp trang thiết bị điện tử */
var i = 0;
function four() {
    if (i == 0) {
        i = 1;
        var elem = document.getElementById("myBarrrr");
        var width = 1;
        var id = setInterval(frame, 10);
        function frame() {
            if (width >= 100) {
                clearInterval(id);
                i = 0;
            } else {
                width++;
                elem.style.width = width + "%";
            }
        }
    }
}

/* nhập khẩu hàng nước ngoài */
var i = 0;
function five() {
    if (i == 0) {
        i = 1;
        var elem = document.getElementById("myBarrrrr");
        var width = 1;
        var id = setInterval(frame, 10);
        function frame() {
            if (width >= 100) {
                clearInterval(id);
                i = 0;
            } else {
                width++;
                elem.style.width = width + "%";
            }
        }
    }
}

/* slide show */
$(document).ready(function () {
    $('.customer-logos').slick({
        slidesToShow: 6,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 1500,
        arrows: false,
        dots: false,
        pauseOnHover: false,
        responsive: [{
            breakpoint: 768,
            settings: {
                slidesToShow: 4
            }
        }, {
            breakpoint: 520,
            settings: {
                slidesToShow: 3
            }
        }]
    });
});
/* backtop */
$(function () {
    $(window).scroll(function () {
      if ($(this).scrollTop() > 100) $(".lentop").fadeIn();
      else $(".lentop").fadeOut();
    });
    $(".lentop").click(function () {
      $("body,html").animate({ scrollTop: 0 }, "slow");
    });
  });