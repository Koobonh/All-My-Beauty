<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>ALL MY BEAUTY</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="${contextPath}/resources/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="${contextPath}/resources/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${contextPath}/resources/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${contextPath}/resources/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${contextPath}/resources/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${contextPath}/resources/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${contextPath}/resources/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${contextPath}/resources/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${contextPath}/resources/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="${contextPath}/resources/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${contextPath}/resources/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${contextPath}/resources/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${contextPath}/resources/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="${contextPath}/resources/images/favicons/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="${contextPath}/resources/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
     <!--  
    JavaScripts
    =============================================
    -->
    <script src="${contextPath}/resources/lib/jquery/dist/jquery.js"></script>
    <script src="${contextPath}/resources/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/lib/wow/dist/wow.js"></script>
    <script src="${contextPath}/resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="${contextPath}/resources/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="${contextPath}/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="${contextPath}/resources/lib/flexslider/jquery.flexslider.js"></script>
    <script src="${contextPath}/resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <%-- <script src="${contextPath}/resources/lib/smoothscroll.js"></script> --%>
    <script src="${contextPath}/resources/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="${contextPath}/resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="${contextPath}/resources/js/plugins.js"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
    <!--  
    Stylesheets
    =============================================
    -->
    <!-- Default stylesheets-->
    <link type="text/css" href="${contextPath}/resources/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="${contextPath}/resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="${contextPath}/resources/css/colors/default.css" rel="stylesheet">
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <nav class="navbar navbar-custom navbar-fixed-top navbar-transparent" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index_shop.html">ALL MY BEAUTY</a>
          </div>
          <div class="collapse navbar-collapse" id="custom-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li><a href="index_shop.html">Home</a></li>
              <li><a href="index_shop.html">로그인</a></li>
              <li><a href="index_shop.html">회원가입</a></li>
              <li><a href="index_shop.html">장바구니</a></li>
              <li><a href="index_shop.html">Q&A</a></li>
              <li><a href="index_shop.html">마이페이지</a></li>
              <!--li.dropdown.navbar-cart-->
              <!--    a.dropdown-toggle(href='#', data-toggle='dropdown')-->
              <!--        span.icon-basket-->
              <!--        |-->
              <!--        span.cart-item-number 2-->
              <!--    ul.dropdown-menu.cart-list(role='menu')-->
              <!--        li-->
              <!--            .navbar-cart-item.clearfix-->
              <!--                .navbar-cart-img-->
              <!--                    a(href='#')-->
              <!--                        img(src='assets/images/shop/product-9.jpg', alt='')-->
              <!--                .navbar-cart-title-->
              <!--                    a(href='#') Short striped sweater-->
              <!--                    |-->
              <!--                    span.cart-amount 2 &times; $119.00-->
              <!--                    br-->
              <!--                    |-->
              <!--                    strong.cart-amount $238.00-->
              <!--        li-->
              <!--            .navbar-cart-item.clearfix-->
              <!--                .navbar-cart-img-->
              <!--                    a(href='#')-->
              <!--                        img(src='assets/images/shop/product-10.jpg', alt='')-->
              <!--                .navbar-cart-title-->
              <!--                    a(href='#') Colored jewel rings-->
              <!--                    |-->
              <!--                    span.cart-amount 2 &times; $119.00-->
              <!--                    br-->
              <!--                    |-->
              <!--                    strong.cart-amount $238.00-->
              <!--        li-->
              <!--            .clearfix-->
              <!--                .cart-sub-totle-->
              <!--                    strong Total: $476.00-->
              <!--        li-->
              <!--            .clearfix-->
              <!--                a.btn.btn-block.btn-round.btn-font-w(type='submit') Checkout-->
              <!--li.dropdown-->
              <!--    a.dropdown-toggle(href='#', data-toggle='dropdown') Search-->
              <!--    ul.dropdown-menu(role='menu')-->
              <!--        li-->
              <!--            .dropdown-search-->
              <!--                form(role='form')-->
              <!--                    input.form-control(type='text', placeholder='Search...')-->
              <!--                    |-->
              <!--                    button.search-btn(type='submit')-->
              <!--                        i.fa.fa-search-->
            </ul>
          </div>
        </div>
      </nav>
      
