<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Déliberation</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600"
    />
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="index/css/all.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="index/css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="index/css/tooplate-style.css" />
    <!--
Tooplate 2111 Pro Line
http://www.tooplate.com/view/2111-pro-line
-->
  </head>

  <body>
    <!-- page header -->
    <div class="container" id="home">
      <div class="col-12 text-center">
        <div class="tm-page-header">
          <i class="fas fa-4x fa-chart-bar mr-4"></i>
          <h1 class="d-inline-block text-uppercase">Déliberation</h1>
        </div>
      </div>
    </div>
    <!-- navbar -->
    <div class="tm-nav-section">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <nav class="navbar navbar-expand-md navbar-light">
              <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#tmMainNav"
                aria-controls="tmMainNav"
                aria-expanded="false"
                aria-label="Toggle navigation"
              >
                <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse" id="tmMainNav">
                <ul class="navbar-nav mx-auto tm-navbar-nav">
                  <li class="nav-item active">
                    <a class="nav-link" href="/home"
                      >Home <span class="sr-only">(current)</span></a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="nav-link external" href="/login">Login</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link external" href="/signup">Sign up</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link external" href="https://www.facebook.com/umi.fs.meknes">FB Page</a>
                  </li>
                </ul>
              </div>
            </nav>
          </div>
        </div>
      </div>
    </div>

    <!-- Video Banner -->
    <section class="tm-banner-section" id="tmVideoSection">
      <div class="container tm-banner-text-container">
        <div class="row">
          <div class="col-12">
            <header>
              <h2 class="tm-banner-title">Université moulay ismail</h2>
              <p class="mx-auto tm-banner-subtitle">
                Ce site web a été réalisé par un éleve genie informatique Bachelor
              </p>
            </header>
          </div>
        </div>
      </div>

      <!-- Video -->
      <video id="hero-vid" autoplay="" loop="" muted>
        <source src="index/videos/city-night-blur-01.mp4" type="video/mp4" />
        Your browser does not support the video tag.
      </video>
    </section>

    <footer class="container tm-footer">
      <div class="row tm-footer-row">
        <p class="col-md-10 col-sm-12 mb-0">
          Copyright &copy; 2021 Bachelor genie informatique
          <a rel="nofollow" href="https://www.facebook.com/tooplate" class="tm-footer-link">Tooplate</a>
        </p>
      </div>
    </footer>

    <script src="index/js/jquery-1.9.1.min.js"></script>
    <!-- Single Page Nav plugin works with this version of jQuery -->
    <script src="index/js/jquery.singlePageNav.min.js"></script>
    <script src="index/js/bootstrap.min.js"></script>
    <script>
      /**
       * detect IE
       * returns version of IE or false, if browser is not Internet Explorer
       */
      function detectIE() {
        var ua = window.navigator.userAgent;

        var msie = ua.indexOf("MSIE ");
        if (msie > 0) {
          // IE 10 or older => return version number
          return parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)), 10);
        }

        var trident = ua.indexOf("Trident/");
        if (trident > 0) {
          // IE 11 => return version number
          var rv = ua.indexOf("rv:");
          return parseInt(ua.substring(rv + 3, ua.indexOf(".", rv)), 10);
        }

        // var edge = ua.indexOf('Edge/');
        // if (edge > 0) {
        //     // Edge (IE 12+) => return version number
        //     return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
        // }

        // other browser
        return false;
      }

      function setVideoHeight() {
        const videoRatio = 1920 / 1080;
        const minVideoWidth = 400 * videoRatio;
        let secWidth = 0,
          secHeight = 0;

        secWidth = videoSec.width();
        secHeight = videoSec.height();

        secHeight = secWidth / 2.13;

        if (secHeight > 600) {
          secHeight = 600;
        } else if (secHeight < 400) {
          secHeight = 400;
        }

        if (secWidth > minVideoWidth) {
          $("video").width(secWidth);
        } else {
          $("video").width(minVideoWidth);
        }

        videoSec.height(secHeight);
      }

      // Parallax function
      // https://codepen.io/roborich/pen/wpAsm
      var background_image_parallax = function($object, multiplier) {
        multiplier = typeof multiplier !== "undefined" ? multiplier : 0.5;
        multiplier = 1 - multiplier;
        var $doc = $(document);
        $object.css({ "background-attatchment": "fixed" });
        $(window).scroll(function() {
          var from_top = $doc.scrollTop(),
            bg_css = "center " + multiplier * from_top + "px";
          $object.css({ "background-position": bg_css });
        });
      };

      $(window).scroll(function() {
        if ($(this).scrollTop() > 50) {
          $(".scrolltop:hidden")
            .stop(true, true)
            .fadeIn();
        } else {
          $(".scrolltop")
            .stop(true, true)
            .fadeOut();
        }

        // Make sticky header
        if ($(this).scrollTop() > 158) {
          $(".tm-nav-section").addClass("sticky");
        } else {
          $(".tm-nav-section").removeClass("sticky");
        }
      });

      let videoSec;

      $(function() {
        if (detectIE()) {
          alert(
            "Please use the latest version of Edge, Chrome, or Firefox for best browsing experience."
          );
        }

        const mainNav = $("#tmMainNav");
        mainNav.singlePageNav({
          filter: ":not(.external)",
          offset: $(".tm-nav-section").outerHeight(),
          updateHash: true,
          beforeStart: function() {
            mainNav.removeClass("show");
          }
        });

        videoSec = $("#tmVideoSection");

        // Adjust height of video when window is resized
        $(window).resize(function() {
          setVideoHeight();
        });

        setVideoHeight();

        $(window).on("load scroll resize", function() {
          var scrolled = $(this).scrollTop();
          var vidHeight = $("#hero-vid").height();
          var offset = vidHeight * 0.6;
          var scrollSpeed = 0.25;
          var windowWidth = window.innerWidth;

          if (windowWidth < 768) {
            scrollSpeed = 0.1;
            offset = vidHeight * 0.5;
          }

          $("#hero-vid").css(
            "transform",
            "translate3d(-50%, " + -(offset + scrolled * scrollSpeed) + "px, 0)"
          ); // parallax (25% scroll rate)
        });

        // Parallax image background
        background_image_parallax($(".tm-parallax"), 0.4);

        // Back to top
        $(".scroll").click(function() {
          $("html,body").animate(
            { scrollTop: $("#home").offset().top },
            "1000"
          );
          return false;
        });
      });
    </script>
  </body>
</html>
