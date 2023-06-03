<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html  lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Quản trị</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="<c:url value='/resources/static/admin1/assets/css/styles.css" rel="stylesheet' /> " />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          crossorigin="anonymous"></script>
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
					<h1 class="mt-4">Chi tiết đợt quyên góp</h1>
					<div class="card mb-4">

						<div class="card-body">
							<!-----------Detail----------------------------------------------------------------------------------->
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Mã đợt
										quyên góp:</label> <input type="text" class="form-control"
										id="addname" name="code" value="${donation.code}"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Tên đợt
										quyên góp:</label> <input type="text" class="form-control"
										id="addcost" name="name" value="${donation.name}"
										readonly="readonly">
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Ngày bắt
										đầu:</label> <input type="date" class="form-control" id="addname"
										name="start" value="${donation.startDate}" readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Ngày kết
										thúc:</label> <input type="date" class="form-control" id="addcost"
										name="end" value="${donation.endDate}" readonly="readonly">
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Tổng tiền
										quyên góp:</label> <input type="text" class="form-control"
										id="addname" name="start" value="${donation.money}"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Trạng thái:</label>
									<c:if test="${donation.status == 0}">
										<input type="text" class="form-control" id="addcost"
											name="end" value="Mới tạo" readonly="readonly">
									</c:if>
									<c:if test="${donation.status == 1}">
										<input type="text" class="form-control" id="addcost"
											name="end" value="Đang quyên góp" readonly="readonly">
									</c:if>
									<c:if test="${donation.status == 2}">
										<input type="text" class="form-control" id="addcost"
											name="end" value="Kết thúc quyên góp" readonly="readonly">
									</c:if>
									<c:if test="${donation.status == 3}">
										<input type="text" class="form-control" id="addcost"
											name="end" value="Đóng quyên góp" readonly="readonly">
									</c:if>

								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Tổ chức:</label> <input
										type="text" class="form-control" id="addname" name="tochuc"
										value="Vì trẻ em" readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Số điện
										thoại:</label> <input type="number" class="form-control" id="addcost"
										name="sdt" value="03800092934" readonly="readonly">
								</div>
								<div class="col-12">
									<label for="ct_id" class="col-form-label">Nội dung:</label>
									<textarea name="noidung" class="form-control" cols="50"
										readonly="readonly">${donation.description}</textarea>
								</div>
							</div>
							<!---------------------Detail---------------------------------------------------------------------->
							<h3 class="mt-4">Danh sách những người quyên góp</h3>
							<table id="datatablesSimple">
								<thead>
									<tr style="background-color: gray !important;">
										<th>Họ Tên</th>
										<th>Tiền quyên góp</th>
										<th>Ngày quyên góp</th>
										<th>Nội dung</th>
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
									<c:forEach var="userdonation" items="${userdonations}">
										<tr>
											<td>${userdonation.name}</td>
											<td>${userdonation.money}</td>
											<td>${userdonation.date}</td>
											<td>${userdonation.text}</td>
											<c:if test="${userdonation.status == 0}">
												<td>Chờ xác nhận</td>
												<td style="display: flex; justify-content: space-between">
													<form method="post" action="confirmdonation">
														<input type="hidden" name="id" value="${userdonation.id}">
														<button type="submit" style="width: 105px"
															class="btn btn-success">Xác nhận</button>
														<button type="button" style="width: 150px"
															class="btn btn-danger">Hủy xác nhận</button>
													</form>

												</td>

											</c:if>
											<c:if test="${userdonation.status == 1}">
												<td>Đã xác nhận</td>
												<td></td>
											</c:if>


										</tr>
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
				<div class="container-fluid px-4"></div>
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
</body>

</html>