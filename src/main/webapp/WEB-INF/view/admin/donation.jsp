<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Quản trị</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value="/resources/admin1/assets/css/styles.css" />"
	rel="stylesheet">
<script
	src="<c:url value="/resources/admin1/assets/js/JQuery3.3.1.js" />"></script>
<script src="<c:url value="/resources/admin1/assets/js/scripts.js" />"></script>
<script
	src="<c:url value="/resources/admin1/assets/js/datatables-simple-demo.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<nav th:fragment="html_nav"
			class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand ps-3" href="/admin/">QUẢN TRỊ</a>
			<!-- Sidebar Toggle-->
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
				id="sidebarToggle" href="#!">
				<i class="fas fa-bars"></i>
			</button>
			<!-- Navbar Search-->
			<form
				class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

			</form>
			<!-- Navbar-->
			<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
				<li class="nav-item dropdown"><a th:if="${session.admin}"
					class="nav-link dropdown-toggle" href="/admin/logout" role="button"><i
						class="fas fa-user fa-fw"></i><span> Logout</span></a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown1">
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Activity Log</a></li>
						<li>
							<hr class="dropdown-divider" />
						</li>
						<li><a class="dropdown-item" href="/logout">Logout</a></li>
					</ul></li>
			</ul>
		</nav>
	</nav>

	<c:if test="${addDonationSuccess == 'Successfully'}" >
 	<div class="toast" data-delay="1000"
		style="position: fixed; top: 100PX; left: 40PX; z-index: 2000; width: 300px">

		<script>
			 swal({
			     title: 'Add Donation Successfully!',
			     /* text: 'Redirecting...', */
			     icon: 'success',
			     timer: 3000,
			     buttons: true,
			     type: 'success'
			 })
		</script>
	</div>
	</c:if>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<div th:fragment="html_menu" id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark"
					id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<a class="nav-link" href="account">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> Quản lý người dùng
							</a> <a class="nav-link" href="donation">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> Quản lý đợt quyên góp
							</a>
						</div>
					</div>

				</nav>
			</div>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Danh sách đợt quyên góp</h1>
					<div class="card mb-4">
						<div class="card-header">
							<button type="button" class="btn btn-success"
								data-bs-toggle="modal" data-bs-target="#exampleModalAdd">
								Thêm mới</button>
							<!-- Modal Add-->
							<div class="modal fade" id="exampleModalAdd" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabelll">Thêm
												mới</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="addDonation" method="post">
												<div class="row">
													<div class="col-6">
														<label for="code" class="col-form-label">Mã đợt
															quyên góp:</label> <input type="text" class="form-control"
															id="code" name="code" required>
													</div>
													<div class="col-6">
														<label for="name" class="col-form-label">Tên
															đợt quyên góp:</label> <input type="text" class="form-control"
															id="name" name="name" required>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="startDate" class="col-form-label">Ngày
															bắt đầu:</label> <input type="date" class="form-control"
															id="startDate" name="startDate" required>
													</div>
													<div class="col-6">
														<label for="endDate" class="col-form-label">Ngày
															kết thúc:</label> <input type="date" class="form-control"
															id="endDate" name="endDate" required>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="organizationName" class="col-form-label">Tổ
															chức:</label> <input type="text" class="form-control"
															id="organizationName" name="organizationName" required>
													</div>
													<div class="col-6">
														<label for="phoneNumber" class="col-form-label">Số
															điện thoại:</label> <input type="text" class="form-control"
															id="phoneNumber" name="phoneNumber" required pattern="[0-9]{10}" title="Phone Number contain ten number">
													</div>
													<div class="col-12">
														<label for="description" class="col-form-label">Nội
															dung:</label>
														<textarea id="description" name="description" class="form-control" cols="50"
															rows="5" placeholder="Nhập nội dung"></textarea>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Đóng</button>
													<button type="submit" class="btn btn-primary">Thêm
													</button>
												</div>
											</form>
										</div>

									</div>
								</div>
							</div>
							<!-- Modal Add-->
						</div>

						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr style="background-color: gray !important;">
										<th>Mã</th>
										<th>Tên</th>
										<th>Ngày bắt đầu</th>
										<th>Ngày kết thúc</th>
										<th>Tổ chức</th>
										<th>Số điện thoại</th>
										<th>Tổng tiền</th>
										<th>Trạng thái</th>
										<th style="width: 220px">Hành động</th>
									</tr>
								</thead>
								<tfoot>
									<tr>

									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="donation" items="${donations}">
										<tr>
											<td>${donation.code}</td>
											<td>${donation.name}</td>
											<td>${donation.startDate}</td>
											<td>${donation.endDate}</td>
											<td>${donation.organizationName}</td>
											<td>${donation.phoneNumber}</td>
											<td>${donation.money} VND</td>
											<c:if test="${donation.status == 1}">
											<td>Mới tạo</td>
											</c:if>
											<c:if test="${donation.status == 2}">
											<td>Đang quyên góp</td>
											</c:if>
											<c:if test="${donation.status == 3}">
											<td>Kết thúc quyên góp</td>
											</c:if>
											<c:if test="${donation.status == 4}">
											<td>Đóng quyên góp</td>
											</c:if>
											<td style="">
											    <c:if test="${donation.status != 4}">
												<button type="button" style="width: 105px"
													class="btn btn-primary" data-bs-toggle="modal"
													data-bs-target="#idModelUpdate${donation.id}">Cập nhật</button>
												</c:if>
												<a style="width: 105px" class="btn btn-warning"
												href="detail?donationId=${donation.id}"> Chi tiết </a>

												<button type="button" style="width: 105px"
													class="btn btn-danger mt-1" data-bs-toggle="modal"
													data-bs-target="#idModelDel${donation.id}">Xóa</button>
												
												<c:if test="${donation.status == 1}">
												<form action="statusToDonate?donationId=${donation.id}" method="post" style="margin-top: 5px">
													<button type="submit" style="width: 105px"
														class="btn btn-success">Quyên góp</button>
												</form>
												</c:if>
												
												<c:if test="${donation.status == 2}">
												<form action="statusToFinish?donationId=${donation.id}" method="post" style="margin-top: 5px">
													<button type="submit" style="width: 105px"
														class="btn btn-success">Kết thúc</button>
												</form>
												</c:if>
												
												<c:if test="${donation.status == 3}">
												<form action="statusToClose" method="post" style="margin-top: 5px">
													<input type="hidden" name="donationId" value="${donation.id}">
													<button type="submit" style="width: 105px"
														class="btn btn-success">Đóng</button>
												</form>
												</c:if>
												
												<div class="modal fade" id="idModelDel${donation.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">Bạn
																	chắc chắn muốn xóa ?</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																Đợt quyên góp : <span>${donation.name}</span>
																<form action ="deleteDonation?donationId=${donation.id}" method="post">
																	<div class="modal-footer" style="margin-top: 20px">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Close</button>
																		<button type="submit" class="btn btn-danger">Xóa</button>

																	</div>
																</form>
															</div>

														</div>
													</div>
												</div>

												<div class="modal fade" id="idModelUpdate${donation.id}" tabindex="-1"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog modal-lg ">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabell">Cập
																	nhật</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<form action="updateDonation?donationId=${donation.id}" method="post">
																	<input type="hidden" name="donationId" value="${donation.id}">
																	<input type="hidden" name="money" value="${donation.money}">
																	<input type="hidden" name="status" value="${donation.status}">
																	<div class="row">
																		<div class="col-6">
																			<label for="code" class="col-form-label">Mã
																				đợt quyên góp:</label> <input type="text"
																				class="form-control" id="code" name="code"
																				required value="${donation.code}">
																		</div>
																		<div class="col-6">
																			<label for="name" class="col-form-label">Tên
																				đợt quyên góp:</label> <input type="text"
																				class="form-control" id="name" name="name"
																				required value="${donation.name}">
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-6">
																			<label for="startDate" class="col-form-label">Ngày
																				bắt đầu:</label> <input type="date" class="form-control"
																				id="startDate" name="startDate" required value="${donation.startDate}">
																		</div>
																		<div class="col-6">
																			<label for="endDate" class="col-form-label">Ngày
																				kết thúc:</label> <input type="date" class="form-control"
																				id="endDate" name="endDate" required value="${donation.endDate}">
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-6">
																			<label for="organizationName" class="col-form-label">Tổ
																				chức:</label> <input type="text" class="form-control"
																				id="organizationName" name="organizationName" required value="${donation.organizationName}">
																		</div>
																		<div class="col-6">
																			<label for="phoneNumber" class="col-form-label">Số
																				điện thoại:</label> <input type="text"
																				class="form-control" id="phoneNumber" name="phoneNumber"
																				required value="${donation.phoneNumber}" pattern="[0-9]{10}" title="Phone Number contain ten number">
																		</div>
																		<div class="col-12">
																			<label for="description" class="col-form-label">Nội
																				dung:</label>
																			<textarea id="description" name="description" class="form-control" cols="50" rows="5" 
																			          placeholder="Nhập nội dung">"${donation.description}"</textarea>
																		</div>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Đóng</button>
																		<button type="submit" class="btn btn-primary">Lưu
																		</button>
																	</div>
																</form>
															</div>

														</div>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>

			</main>
		</div>
	</div>

			<script>

      ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
      })
              .catch(error => {
                console.error(error);
              });

    </script>
			<script>

      var dodai = document.getElementById("dodai").value;
      var a = parseInt(dodai);
      for(var i = 1;i<=a+10;i++){
        var name = "#editor"  + i
        ClassicEditor.create(document.querySelector(name)).then(eidt => {
          console.log("da" + eidt);
        })
                .catch(error => {
                  console.error(error);
                });
      }


    </script>
    
</body>

</html>