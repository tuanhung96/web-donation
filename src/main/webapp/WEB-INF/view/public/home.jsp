<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
<title>Donation website &mdash; Website Donation</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />
<link rel="shortcut icon" href="ftco-32x32.png">

<link href="<c:url value="/resources/user/assets/css/custom-bs.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/user/assets/css/jquery.fancybox.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/user/assets/css/bootstrap-select.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/user/assets/fonts/icomoon/style.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/user/assets/fonts/line-icons/style.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/user/assets/css/owl.carousel.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/user/assets/css/animate.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/user/assets/css/style.css" />"
	rel="stylesheet">

<script src="<c:url value="/resources/user/assets/js/jquery.min.js" />"></script>
<script
	src="<c:url value="/resources/user/assets/js/bootstrap.bundle.min.js" />"></script>
<script
	src="<c:url value="/resources/user/assets/js/isotope.pkgd.min.js" />"></script>
<script
	src="<c:url value="/resources/user/assets/js/stickyfill.min.js" />"></script>
<script
	src="<c:url value="/resources/user/assets/js/jquery.fancybox.min.js" />"></script>
<script
	src="<c:url value="/resources/user/assets/js/jquery.easing.1.3.js" />"></script>
<script
	src="<c:url value="/resources/user/assets/js/jquery.waypoints.min.js" />"></script>
<script
	src="<c:url value="/resources/user/assets/js/jquery.animateNumber.min.js" />"></script>
<script
	src="<c:url value="/resources/user/assets/js/owl.carousel.min.js" />"></script>
<script
	src="<c:url value="/resources/user/assets/js/bootstrap-select.min.js" />"></script>
<script src="<c:url value="/resources/user/assets/js/custom.js" />"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body id="top">

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<c:if test="${donateSuccess == 'DonateSuccessfully'}" >
 	<div class="toast" data-delay="1000"
		style="position: fixed; top: 100PX; left: 40PX; z-index: 2000; width: 300px">

		<script>
			 swal({
			     title: 'Donate Successfully!',
			     /* text: 'Redirecting...', */
			     icon: 'success',
			     timer: 3000,
			     buttons: true,
			     type: 'success'
			 })
		</script>
	</div>
	</c:if>

	<div class="site-wrap">

		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<!-- .site-mobile-menu -->


		<!-- NAVBAR -->
		<header class="site-navbar mt-3">
			<div class="container-fluid">
				<div class="row align-items-center">
					<div class="site-logo col-6">
						<a href="/">Website Quyên Góp</a>
					</div>
					<nav class="mx-auto site-navigation">
						<ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
							<li th:if="${session.user}" class="d-lg-none"><a
								href="post-job.html"><span class="mr-2"
									th:text="${session.user.fullName}"></span> </a></li>
							<li class="d-lg-none" th:if="${session.user}"><a
								href="/user/logout">Đăng xuất</a></li>
							<li class="d-lg-none" th:unless="${session.user}"><a
								href="/user/login">Đăng nhập</a></li>
						</ul>
					</nav>

					<div
						class="right-cta-menu text-right d-flex aligin-items-center col-6">
						<div class="ml-auto">
							<a href="/user/logout" th:if="${session.user}"
								class="btn btn-primary border-width-2 d-none d-lg-inline-block">Log
								Out</a> 
							<a href="/user/login" th:unless="${session.user}"
								class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span
								class="mr-2 icon-lock_outline"></span>Log In</a>
						</div>
						<a href="#"
							class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span
							class="icon-menu h3 m-0 p-0 mt-2"></span></a>
					</div>

				</div>
			</div>
		</header>

		<!-- HOME -->

		<section class="section-hero overlay inner-page bg-image"
			style="background-image: url('<c:url value="/resources/user/assets/images/hero_1.jpg" />');"
			id="home-section">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<h1 class="text-white font-weight-bold">Danh sách các đợt
							quyên góp</h1>

					</div>
				</div>
			</div>
		</section>

		<section class="site-section">
			<div class="container">

				<div class="row mb-5 justify-content-center">
					<div class="col-md-7 text-center">
						<h2 class="section-title mb-2">Các đợt quyên góp</h2>
					</div>
				</div>

				<ul class="job-listings mb-5">

					<c:forEach var="donation" items="${donations}">
						<li style="margin-bottom: 20px"
							class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center ">
							<div
								class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
								<div class="job-listing-position custom-width mb-3 mb-sm-0"
									style="padding: 10px; width: 250px">
									<h2>
										<a style="height: 22px; position: static"
											href="detail?donationId=${donation.id}">${donation.name}</a>
									</h2>
									<c:if test="${donation.status == 1}">
										<strong> Mới tạo </strong>
									</c:if>
									<c:if test="${donation.status == 2}">
										<strong> Đang quyên góp </strong>
									</c:if>
									<c:if test="${donation.status == 3}">
										<strong> Kết thúc quyên góp </strong>
									</c:if>
									<c:if test="${donation.status == 4}">
										<strong> Đóng quyên góp </strong>
									</c:if>
								</div>
								<div class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
									style="padding: 10px;">
									Ngày bắt đầu<br> <strong>${donation.startDate}</strong><br>
								</div>
								<div class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
									style="padding: 10px;">
									Ngày kết thúc<br> <strong>${donation.endDate}</strong><br>
								</div>
								<div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"
									style="padding: 10px;">
									<span class="icon-room"></span> <span>${donation.organizationName}</span><br>
									<strong>${donation.phoneNumber}</strong><br>
								</div>
								<c:if test="${donation.status == 2}">
									<div class="job-listing-meta custom-width w-20">
										<button style="margin-top: 20px" class="btn btn-primary py-2"
											data-bs-toggle="modal"
											data-bs-target="#idModelDonate${donation.id}">Quyên
											góp</button>
									</div>
								</c:if>
								<c:if test="${donation.status != 2}">
									<p
										style="margin-top: 20px; background-color: white !important;"
										class="btn py-2">
										<span style="color: white">Quyên góp</span>
									</p>
								</c:if>
							</div>
						</li>

						<!-- Modal -->

						<div class="modal fade" id="idModelDonate${donation.id}"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">
											Quyên góp: <span>${donation.name}</span>
										</h5>
										<button type="button" class="close" data-bs-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form action="addUserDonation" method="post">
										<div class="modal-body">
											<div class="row">

												<div class="col-12">
													<label for="addname" class="col-form-label">Họ tên:</label>
													<input type="text" class="form-control" id="addname" name="name" required> 
													<label for="addname" class="col-form-label">Số tiền quyên góp:</label>
													<input type="number" class="form-control" id="addname" name="money" required>													
													<!-- <input type="hidden" class="form-control" id="addname" name="userId" value="">  -->
													<input type="hidden" class="form-control" id="addname" name="donationId" value="${donation.id}"> 
													<label for="addname" class="col-form-label">Lời nhắn:</label>
													<textarea rows="10" cols="3" class="form-control" name="message"></textarea>
												</div>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Đóng</button>
												<button type="submit" data-toggle="modal" class="btn btn-primary">Quyên góp</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
				</ul>
				
				<div class="row pagination-wrap">
					<div class="col-md-6 text-center text-md-left mb-4 mb-md-0">

					</div>
					<div class="col-md-6 text-center text-md-right">
						<div class="custom-pagination ml-auto">
						    <c:if test="${pageNumber==1}">
							<span class="prev" style="color:white">Prev</span>
							</c:if>
							<c:if test="${pageNumber<=totalPage and pageNumber>1}">
							<a class="prev" href="home?page=${pageNumber-1}">Prev</a>
							</c:if>
							<div class="d-inline-block"></div>
							<c:if test="${pageNumber<totalPage and pageNumber>=1}">
							<a class="next" href="home?page=${pageNumber+1}">Next</a>
							</c:if>
							<c:if test="${pageNumber==totalPage}">
							<span class="next" style="color:white">Next</span>
							</c:if>
						</div>
					</div>
				</div>

			</div>
		</section>

		<!-- footer -->
		<%@ include file="footer.jsp" %>
		<!-- footer -->

	</div>

</body>
</html>