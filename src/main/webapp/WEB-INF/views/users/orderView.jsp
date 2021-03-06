<!-- sử dụng tiếng việt -->
<%@page import="com.devpro.entities.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- spring taglibs -->
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8]><html class="ie ie8"><![endif]-->
<!--[if IE 9]><html class="ie ie9"><![endif]-->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="apple-touch-icon.png" rel="apple-touch-icon">
    <link href="${base}/resources/user/images/logo_fastsneaker.jpg" rel="icon">
    <meta name="author" content="Nghia Minh Luong">
    <meta name="keywords" content="Default Description">
    <meta name="description" content="Default keyword">
    <title>Sky - Checkout</title>
    <!-- Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="${base}/resources/user/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/ps-icon/style.css">
    <!-- CSS Library-->
    <link rel="stylesheet" href="${base}/resources/user/plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/Magnific-Popup/dist/magnific-popup.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/revolution/css/settings.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/revolution/css/layers.css">
    <link rel="stylesheet" href="${base}/resources/user/plugins/revolution/css/navigation.css">
    <!-- Custom-->
    <link rel="stylesheet" href="${base}/resources/user/css/style.css">
    
  </head>
  
  	<!-- header -->
		<jsp:include page="/WEB-INF/views/users/common/header.jsp"></jsp:include>
	<!-- /header -->

  <body class="ps-loading">
    <main class="ps-main">
      <div class="ps-checkout pt-80 pb-80">
        <div class="ps-container">
        <div class="info-1">
			<div class="title">
				<span>Receiver's Address</span>
			</div>
			<div class="content">
				<br> <span style="font-size: 18px; font-weight: bold;">${saleOrders.customerName }</span><br>
				<span>Address: ${saleOrders.customerAddress }</span>
				<br> 
				<span>Phone: ${saleOrders.customerPhone }</span>
				<c:choose>
					<c:when test="${saleOrders.status == 'true'}">
						<span style="background: #FFFF00; border-radius: 5px; color: white;">&nbsp;Pending&nbsp;</span>
					</c:when>
					<c:otherwise>
						<span style="background: #0099FF; border-radius: 5px; color: white;">&nbsp;Completed&nbsp;</span>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
        
		   <table class="table table-bordered text-center">
		    <thead>
		      <tr>
		        <th class="text-center h3 font-weight-bold">Product</th>
		        <th class="text-center h3 font-weight-bold">Price</th>
		        <th class="text-center h3 font-weight-bold">Sale Price</th>
		        <th class="text-center h3 font-weight-bold">Quantity</th>
		        <th class="text-center h3 font-weight-bold">Provisional</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach var="saleOrderProduct" items="${saleOrderProducts }">
				<tr>
					<td><img alt="" style="width: 80px" src="${base}/file/upload/${saleOrderProduct.product.productImages[0].path}"><span>
					<a href="${base}/detail-product/${saleOrderProduct.product.seo }">${saleOrderProduct.product.title }</a></span></td>
					<td>${saleOrderProduct.product.priceVN }</td>
					<td>0 đ</td>
					<td>${saleOrderProduct.quantity }</td>
					<td>${saleOrderProduct.product.price } $</td>
				</tr>
			</c:forEach>
		    </tbody>
		  </table>
        </div>
      </div>

    </main>
    <!-- JS Library-->
    <script type="text/javascript" src="${base}/resources/user/plugins/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/gmap3.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/slick/slick/slick.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/elevatezoom/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/Magnific-Popup/dist/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="${base}/resources/user/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg&amp;region=GB"></script><script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<script type="text/javascript" src="${base}/resources/user/plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="${base}/resources/user/js/main.js"></script>
  </body>
</html>