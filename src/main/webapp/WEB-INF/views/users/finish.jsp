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
            <div class="row">
                  <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                    <div class="ps-checkout__billing">
                      <h3>Billing Detail</h3>
                            <div class="form-group form-group--inline">
                              <label for="exampleInputEmail1">Name<span>*</span>
                              </label>
                              ${customerName }     
                            </div>
                            <div class="form-group form-group--inline">
                              <label for="exampleInputEmail1">Phone<span>*</span>
                              </label>
                              ${customerPhone }
                            </div>
                            <div class="form-group form-group--inline">
                              <label for="exampleInputPassword1">Email Address<span>*</span>
                              </label>
                              ${customerEmail }
                            </div>
                            <div class="form-group form-group--inline">
                              <label for="exampleInputPassword1">Address<span>*</span>
                              </label>
                              ${customerAddress }
                            </div>
                    </div>
                  </div>
                  <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                    <div class="ps-checkout__order">
                      <header>
                        <h3>Your Order</h3>
                      </header>
                      <div class="content">
                        <table class="table ps-checkout__products">
                          <thead>
                            <tr>
                              <th class="text-uppercase">Product</th>
                              <th class="text-uppercase">Total</th>
                            </tr>
                          </thead>
                          <tbody>
                          <c:forEach items="${cartItems}" var="item">
                            <tr>
                              <td>${item.productName } $ x ${item.quantity }</td>
                              <td>${item.unitPrice*item.quantity } $</td>
                            </tr>
						  </c:forEach>
                            <tr>
                              <td  style="color: yellow">Order Total</td>
                              <td  style="color: yellow">${sum } $</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <footer>
                        <h3>Payment Method</h3>
                        <div class="form-group cheque">
                          <div class="" style="color: white">
                            <label>Cheque Payment</label>
                            <form action="${base }/cart/thankyou" method="post">
                            	<button type="submit" class="ps-btn ps-btn--fullwidth">CHEQUE PAYMENT<i class="ps-icon-next"></i></button>
                          	</form>
                          </div>
                        </div>
                        <div class="form-group paypal">
                          <div class="ps-radio--inline"  style="color: white">
                            <label>Paypal</label>
                          </div>
                          <ul class="ps-payment-method">
                            <li><a href="#"><img src="${base}/resources/user/images/payment/1.png" alt=""></a></li>
                            <li><a href="#"><img src="${base}/resources/user/images/payment/2.png" alt=""></a></li>
                            <li><a href="#"><img src="${base}/resources/user/images/payment/3.png" alt=""></a></li>
                          </ul>
                          <form action="${base }/paypal" method="post">
                          	<button type="submit" class="ps-btn ps-btn--fullwidth">PAYPAL<i class="ps-icon-next"></i></button>
                          </form>
                        </div>
                      </footer>
                    </div>
                    <div class="ps-shipping">
                      <h3>FREE SHIPPING</h3>
                      <p>YOUR ORDER QUALIFIES FOR FREE SHIPPING.<br> <a href="#"> Singup </a> for free shipping on every order, every time.</p>
                    </div>
                  </div>
            </div>
        </div>
      </div>
      
      <!-- footer -->
		<jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>
	  <!-- /footer -->
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