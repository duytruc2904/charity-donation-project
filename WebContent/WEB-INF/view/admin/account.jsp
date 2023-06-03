<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Quản trị</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="<c:url value='/resources/static/admin1/assets/css/styles.css' />" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/static/admin1/assets/js/scripts.js' /> "></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/static/admin1/assets/js/datatables-simple-demo.js' /> "></script>
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
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
				<li class="nav-item dropdown"><c:if test="${session.admin}">
						<a class="nav-link dropdown-toggle"
							href="<c:url value='/admin/logout' />" role="button"> <i
							class="fas fa-user fa-fw"></i><span> Logout</span>
						</a>
					</c:if>
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

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<div th:fragment="html_menu" id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark"
					id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/account">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> Quản lý người dùng
							</a> <a class="nav-link"
								href="${pageContext.request.contextPath}/admin/donation">
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

							<!-------------- Modal Add ------------------------------------------------------------------------------------>
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

											<!-------------------- Add user    duytruc ---------------------------------------------------->

											<form method="post" modelAttribute="user" action="<%= request.getContextPath() %>/admin/saveUser">
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Name:</label>
														<input type="text" class="form-control" id="addname"
															name="fullName" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Email:</label>
														<input type="email" class="form-control" id="addcost"
															name="email" required>

													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Số
															điện thoại:</label> <input type="number" class="form-control"
															id="addname" name="phoneNumber" required>

													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Địa
															chỉ:</label> <input type="text" class="form-control" id="addcost"
															name="address" required>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Tài
															khoản:</label> <input type="text" class="form-control"
															id="addname" name="userName" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Mật
															khẩu:</label> <input type="password" class="form-control"
															id="addcost" name="password" required>
													</div>
													<div class="col-6">
														<label for="ct_id" class="col-form-label">Vai trò:</label>
														<select class="form-control" id="ct_id" name="role"
															required>
															<option value="" selected disabel>Chọn loại vai
																trò</option>
															<option value="Admin">Admin</option>
															<option value="User">User</option>

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
						<!---------------- Modal success add User-  ---------------------------------------------------------------------->

						<div class="modal fade" id="successModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">
											Thêm người dùng thành công <span></span>
										</h5>
										<button type="button" class="close" data-dismiss="modal"
											onclick="closeSuccessModal()" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p class="modal-title" id="exampleModalLabel">
											Đã Thêm người dùng thành công <span></span>
										</p>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											onclick="closeSuccessModal()" data-dismiss="modal">Đóng</button>
									</div>

								</div>
							</div>
						</div>
                        <!-- Get User -->
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr style="background-color: gray !important;">
										<th>Họ tên</th>
										<th>Email</th>
										<th>Số điện thoại</th>
										<!--                <th>Địa chỉ</th>-->
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
									<c:set var="dodai" value="${list.size()}" />
									<input type="hidden" value="${dodai}" id="dodai" />
									<c:forEach var="user" items="${list}">
										<tr>
											<td>${user.fullName}</td>
											<td>${user.email}</td>
											<td>${user.phoneNumber}</td>
											<td>${user.userName}</td>
											<td>${user.role}</td>
											<c:if test="${user.status == 1}">
												<td style="color: #1c7430; font-weight: bold">Hoạt động</td>
											</c:if>
											<c:if test="${user.status == 0}">
												<td class="lockuser">Đã khóa</td>
											</c:if>

											<td style="width: 270px">
												<button type="button" style="width: 80px"
													class="btn btn-success" data-bs-toggle="modal"
													data-bs-target="#idModelMail${user.id}">Gửi</button>
												<button type="button" style="width: 80px"
													class="btn btn-primary" data-bs-toggle="modal"
													data-bs-target="#exampleModal${user.id}">Sửa</button>
												<button type="button" style="width: 80px"
													class="btn btn-warning" data-bs-toggle="modal"
													data-bs-target="#idModelDetail${user.id}">Chi tiết
												</button>

												<button type="button" style="width: 80px"
													class="btn btn-danger mt-1" data-bs-toggle="modal"
													data-bs-target="#idModelDel${user.id}">Xóa</button> <c:if
													test="${user.status == 1}">
													<form action="<%= request.getContextPath() %>/admin/lockUser" method="post">
														<input type="hidden" class="form-control" id="id"
															name="idUser" value="${user.id}" />
														<button type="submit" style="width: 80px"
															class="btn btn-danger">Khóa</button>
													</form>
												</c:if> <c:if test="${user.status == 0}">
													<form action="<%= request.getContextPath() %>/admin/unlockUser" method="post">
														<input type="hidden" class="form-control" id="id"
															name="idUser" value="${user.id}" />
														<button type="submit" style="width: 80px"
															class="btn btn-success">Mở</button>
													</form>
												</c:if>
												<!----------------- Modal delete user --------------------------------------------->
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
																<form action="<%= request.getContextPath() %>/admin/deleteUser" method="post">
																	<input type="hidden" class="form-control" id="id"
																		name="idUser" value="${user.id}">

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
												
												
												<!-------------------- popup send user ------------------------------------------------>
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
																<form >
																	<input type="hidden" class="form-control" id="id"
																		name="idUser" value="${user.id}"> <label
																		for="addname" class="col-form-label">Nội dung:</label>
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
												</div> <!-----------------  popup detail user -------------------------------------------->
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
																		<p>${user.role}</p>
																		<h5>Lần đăng nhập gần nhất:</h5>
																		<p>${user.created}</p>
																		<h5>Note:</h5>
																		<p>${user.note}</p>
																	</div>

																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>


										<!-------------- Modal Update------------------------------------------------------------------->
										<div class="modal fade" id="exampleModal${user.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-lg ">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabell">Cập
															nhật</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form action="<%= request.getContextPath() %>/admin/updateUser" method="post"
															modelAttribute="user">
															<input type="hidden" name="id" value="${user.id}">
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Họ
																		và tên: </label> <input type="text" class="form-control"
																		id="addname" name="fullName" value="${user.fullName}"
																		required>
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Email:</label>
																	<input readonly type="email" class="form-control"
																		id="addcost" name="email" value="${user.email}"
																		required>
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Số
																		điện thoại:</label> <input type="number" class="form-control"
																		id="addname" name="phoneNumber"
																		value="${user.phoneNumber}" required>
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Địa
																		chỉ:</label> <input type="text" class="form-control"
																		id="addcost" name="address" value="${user.address}"
																		required>
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Tài
																		khoản:</label> <input readonly type="text"
																		class="form-control" id="addname" name="userName"
																		value="${user.userName}" required> <input
																		readonly type="hidden" class="form-control"
																		id="addname" name="password" value="${user.password}"
																		required> <input readonly type="hidden"
																		class="form-control" id="addname" name="status"
																		value="${user.status}" required>
																</div>
																<div class="col-6">
																	<label for="ct_id" class="col-form-label">Vai trò:</label>
																		<select class="form-control" id="ct_id" name="role" required>
																		<option value="${user.role}" selected>${user.role}</option>
																		<option value="Admin">Admin</option>
																		<option value="User">User</option>
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

									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</main>



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
			<footer class="py-4 bg-light mt-auto">
				<c:import url="admin/fragments" />
			</footer>
		</div>
	</div>


	<script
		src="<c:url value='/resources/static/admin1/assets/js/JQuery3.3.1.js' /> "></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="<c:url value='/resources/static/admin1/assets/js/scripts.js' /> "></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="<c:url value='/resources/static/admin1/assets/js/datatables-simple-demo.js' /> "></script>
	<script>
$(function(){
	 var success = getUrlParameter('success');
	    
    if (success) {
        $('#successModal').modal('show');
    }

    
   });
</script>
<script>
function closeSuccessModal() {
	$('#successModal').modal('hide');
}
</script>
<script>
  var selectElement = document.getElementById("ct_id");

  selectElement.addEventListener("click", function() {
	  selectElement.options[0].textContent = "Chọn loại vai trò";
  });
</script>

</body>

</html>