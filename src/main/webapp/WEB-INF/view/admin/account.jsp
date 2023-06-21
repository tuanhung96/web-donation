<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script
	src="<c:url value="/resources/admin1/assets/js/datatables-simple-demo.js" />"></script>
<script src="<c:url value="/resources/admin1/assets/js/scripts.js" />"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
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
<%-- 			<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
				<li class="nav-item dropdown">
				    <a th:if="${session.admin}"
					    class="nav-link dropdown-toggle" href="/admin/logout" role="button">
					    <i class="fas fa-user fa-fw"></i>
					    <span> Logout</span>
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown1">
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Activity Log</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="/logout">Logout</a></li>
					</ul>
				</li>
			</ul> --%>
		</nav>
	</nav>

	<c:if test="${addUserSuccess == 'Successfully'}" >
 	<div class="toast" data-delay="1000"
		style="position: fixed; top: 100PX; left: 40PX; z-index: 2000; width: 300px">

		<script>
			 swal({
			     title: 'Add User Successfully!',
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
					<h1 class="mt-4">Danh sách người dùng</h1>
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
											<form action="addUser" method="post">
												<div class="row">
													<div class="col-6">
														<label for="fullName" class="col-form-label">Name:</label>
														<input type="text" class="form-control" id="fullName" name="fullName" required>
														
													</div>
													<div class="col-6">
														<label for="email" class="col-form-label">Email:</label>
														<input type="email" class="form-control" id="email" name="email" required 
														pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}" title="Invalid email">
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="phoneNumber" class="col-form-label">Số điện thoại:</label> 
														<input type="text" class="form-control" id="phoneNumber" name="phoneNumber"
																				required pattern="[0-9]{10}" title="Phone Number contain ten number">
														
													</div>
													<div class="col-6">
														<label for="address" class="col-form-label">Địa chỉ:</label> 
														<input type="text" class="form-control" id="address" name="address" required>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="userName" class="col-form-label">Tài khoản:</label> 
														<input type="text" class="form-control" id="userName" name="userName" required> 
																		        
													</div>
													<div class="col-6">
														<label for="password" class="col-form-label">Mật khẩu:</label> 
														<input type="text" class="form-control" name="password" id="password" required>
													</div>
													<div class="col-6">
														<label for="ct_id" class="col-form-label">Vai trò:</label> 
														<select class="form-control" id="roleId" name="roleId"
															required>
															<option value="2">User</option>
															<option value="1">Admin</option>
														</select>
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
										<th>Họ tên</th>
										<th>Email</th>
										<th>Số điện thoại</th>
										<th>Địa chỉ</th>
										<th>Tài khoản</th>
										<th>Vai trò</th>
										<th>Trạng thái</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tfoot>
									<tr>

									</tr>
								</tfoot>
								<tbody>
									<input type="hidden" th:value="${list.size()}" id="dodai" />

									<c:forEach var="user" items="${users}">
										<tr>
											<td>${user.fullName}</td>
											<td>${user.email}</td>
											<td>${user.phoneNumber}</td>
											<td>${user.address}</td>
											<td>${user.userName}</td>
											<c:if test="${user.role.id == 1}">
												<td>Admin</td>
											</c:if>
											<c:if test="${user.role.id == 2}">
												<td>User</td>
											</c:if>
											
											<c:if test="${user.status == 1}">
												<td style="color: #1c7430; font-weight: bold">Hoạt động
												</td>
											</c:if>
											<c:if test="${user.status == 2}">
												<td style="color: red; font-weight: bold">Đã khóa</td>
											</c:if>

											<td style="width: 270px">
												<button type="button" style="width: 80px"
													class="btn btn-success" data-bs-toggle="modal"
													data-bs-target="#idModelMail${user.id}">Gửi
												</button>
												<button type="button" style="width: 80px"
													class="btn btn-primary" data-bs-toggle="modal"
													data-bs-target="#exampleModal${user.id}">
													Sửa</button>
												<button type="button" style="width: 80px"
													class="btn btn-warning" data-bs-toggle="modal"
													data-bs-target="#idModelDetail${user.id}">Chi
													tiết</button>
												<button type="button" style="width: 80px"
													class="btn btn-danger mt-1" data-bs-toggle="modal"
													data-bs-target="#idModelDel${user.id}">Xóa</button> 
													
												<c:if test="${user.status == 1}">
													<form action="lock?userId=${user.id}" method="post"
														style="margin-left: 85px; margin-top: -38px">
														<button type="submit" style="width: 80px"
															class="btn btn-danger">Khóa</button>
													</form>
												</c:if> 
												<c:if test="${user.status == 2}">
													<form action="unlock?userId=${user.id}" method="post">
														<button type="submit" style="width: 80px"
															class="btn btn-success">Mở</button>
													</form>
												</c:if>

												<div class="modal fade" id="idModelDel${user.id}"
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
																Người dùng : <span>${user.fullName}</span>
																<form:form action="delete?userId=${user.id}" method="post">
																    <%-- <c:param name="userId" value="${user.id}"/> --%>
																	<div class="modal-footer" style="margin-top: 20px">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Close</button>
																		<button type="submit" class="btn btn-danger">Xóa</button>

																	</div>
																</form:form>
															</div>

														</div>
													</div>
												</div>

												<div class="modal fade" id="idModelMail${user.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">
																	Gửi đến: <span>${user.email}</span>
																</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<form action="send-mail" method="post">
                                                                    <label for="addname" class="col-form-label">Nội dung:</label>
																	<textarea rows="10" class="form-control" id="addname"
																		name="note"></textarea>
																	<div class="modal-footer" style="margin-top: 20px">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Đóng</button>
																		<button type="submit" class="btn btn-success">Gửi</button>

																	</div>
																</form>

															</div>

														</div>
													</div>
													
												</div> <!-- detail model -->
												
												<div class="modal fade" id="idModelDetail${user.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">
																	Chi tiết : <span>${user.fullName}</span>
																</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<div class="col-6">
																		<h5>Họ tên :</h5>
																		<p>${user.fullName}</p>
																		<h5>Email:</h5>
																		<p>${user.email}</p>
																		<h5>Số điện thoại:</h5>
																		<p>${user.phoneNumber}</p>
																		<h5>Tài khoản:</h5>
																		<p>${user.userName}</p>
																	</div>
																	<div class="col-6">
																		<h5>Địa chỉ :</h5>
																		<p>${user.address}</p>
																		<h5>Vai trò:</h5>
																		<p>${user.role.roleName}</p>
																		<h5>Lần đăng nhập gần nhất:</h5>
																		<%-- <p>${user.createdAt}</p> --%>
																		<h5>Note:</h5>
																		<%-- <p>${user.note}</p> --%>
																	</div>

																</div>
															</div>
														</div>
													</div>
												</div> 
												
												<!-- Modal Update-->
												<div class="modal fade" id="exampleModal${user.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-lg ">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabell">Cập nhật</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<form action="updateUser" method="get">
																	<%-- <input type="hidden" name="id" id="id" value="${user.id}"> --%>
																	<div class="row">
																		<div class="col-6">
																			<label for="fullName" class="col-form-label">Họ
																				và tên:</label> <input type="text" class="form-control"
																				id="fullName" name="fullName" required value="${user.fullName}">
																		</div>
																		<div class="col-6">
																			<label for="email" class="col-form-label">Email:</label>
																			<input readonly type="email" class="form-control"
																				id="email" name="email" required value="${user.email}" 
																				pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}" title="Invalid email">
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-6">
																			<label for="phoneNumber" class="col-form-label">Số
																				điện thoại:</label> <input type="text"
																				class="form-control" id="phoneNumber" name="phoneNumber"
																				required value="${user.phoneNumber}" pattern="[0-9]{10}" title="Phone Number contain ten number">
																		</div>
																		<div class="col-6">
																			<label for="address" class="col-form-label">Địa
																				chỉ:</label> <input type="text" class="form-control"
																				id="address" name="address" required value="${user.address}">
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-6">
																			<label for="userName" class="col-form-label">Tài khoản:</label> 
																				<input readonly type="text"
																				class="form-control" id="userName" name="userName"
																				required value="${user.userName}"> 
																		        <input readonly type="hidden" name="password" id="password" value="${user.password}">
																				<input readonly type="hidden" name="userId" id="userId" value="${user.id}">
																				<input readonly type="hidden" id="status" name="status" value="${user.status}">
																		</div>
																		<div class="col-6">
																			<label for="roleId" class="col-form-label">Vai trò:</label> 
																			<select class="form-control" id="roleId"
																				name="roleId" required>
																				<option value="${user.role.id}" selected>${user.role.roleName}</option>

																				<c:if test="${user.role.id == 1}">
																					<option value="2">user</option>
																				</c:if>
																				<c:if test="${user.role.id == 2}">
																					<option value="1">admin</option>
																				</c:if>
																			</select>
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
												<!-- Modal Update-->
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

<!-- <script>
jQuery(document).ready(
		function($) {

			$("#btn-updateUser").click(function(event) {

				var data = {}
				data["id"] = $("#id").val();
				data["fullName"] = $("#fullName").val();
				data["email"] = $("#email").val();
				data["phoneNumber"] = $("#phoneNumber").val();
				data["address"] = $("#address").val();
				data["userName"] = $("#userName").val();
				data["password"] = $("#password").val();
				data["status"] = $("#status").val();
				data["roleId"] = $("#roleId").val();

				$.ajax({
			             type: "POST",
			             contentType: "application/json",
			             url: "admin/updateUser",
			             data: JSON.stringify(data),
			             dataType: 'json',
			             timeout: 600000,
			             success: function (data) {
			                 
			                 //...
			             },
			             error: function (e) {
			                 
			                 //...
			             }
				});
			

			});

		});

    </script> -->

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