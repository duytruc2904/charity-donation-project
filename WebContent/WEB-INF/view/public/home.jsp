<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<html xmlns:th="http://www.thymeleaf.org" lang="en">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Donation website &mdash; Website Donation</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="author" content="Free-Template.co" />
        <link rel="shortcut icon" href="ftco-32x32.png">
        
        <link type="text/css" rel="stylesheet" href="<c:url value='/resources/static/user/assets/css/custom-bs.css' />"> 
        <link type="text/css" rel="stylesheet" href="<c:url value='/resources/static/user/assets/css/jquery.fancybox.min.css' />" >
        <link type="text/css" rel="stylesheet" href="<c:url value='/resources/static/user/assets/css/bootstrap-select.min.css' /> ">
        <link type="text/css" rel="stylesheet" href="<c:url value='/resources/static/user/assets/fonts/icomoon/style.css' /> ">
        <link type="text/css" rel="stylesheet" href="<c:url value='/resources/static/user/assets/fonts/line-icons/style.css' /> ">
        <link type="text/css" rel="stylesheet" href="<c:url value='/resources/static/user/assets/css/owl.carousel.min.css' /> ">
        <link type="text/css" rel="stylesheet" href="<c:url value='/resources/static/user/assets/css/animate.min.css' /> ">
      
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="<c:url value='/resources/static/user/assets/css/style.css' /> ">
        
        <script src="<c:url value='/resources/static/user/assets/js/jquery.min.js' /> "></script>
        <script src="<c:url value='/resources/static/user/assets/js/bootstrap.bundle.min.js' /> "></script>
        <script src="<c:url value='/resources/static/user/assets/js/isotope.pkgd.min.js' /> "></script>
        <script src="<c:url value='/resources/static/user/assets/js/stickyfill.min.js' /> "></script>
        <script src="<c:url value='/resources/static/user/assets/js/jquery.fancybox.min.js' /> "></script>
        <script src="<c:url value='/resources/static/user/assets/js/jquery.easing.1.3.js' /> "></script>
    
        <script src="<c:url value='/resources/static/user/assets/js/jquery.waypoints.min.js' /> "></script>
        <script src="<c:url value='/resources/static/user/assets/js/jquery.animateNumber.min.js' /> "></script>
        <script src="<c:url value='/resources/static/user/assets/js/owl.carousel.min.js' /> "></script>
        <script src="<c:url value='/resources/static/user/assets/js/bootstrap-select.min.js' /> "></script>
        <script src="<c:url value='/resources/static/user/assets/js/custom.js' /> "></script>
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
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
<c:if test="${not empty msg}">
	<div class="toast" data-delay="1000"
		style="position: fixed; top: 100PX; left: 40PX; z-index: 2000; width: 300px">

		<script>
			swal({
				title : 'Donate Successfully!',
				/* text: 'Redirecting...', */
				icon : 'success',
				timer : 3000,
				buttons : true,
				type : 'success'
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
    </div> <!-- .site-mobile-menu -->


    <!-- NAVBAR -->
    <header class="site-navbar mt-3">
        <div class="container-fluid">
            <div class="row align-items-center">
              <div class="site-logo col-6"><a href="/">Website Quyên Góp</a></div>
      
            </div>
          </div>
    </header>

    <!-- HOME -->
    <section class="section-hero overlay inner-page bg-image" style="background-image: url('<c:url value='/resources/static/user/assets/images/hero_1.jpg' />')";" id="home-section">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <h1 class="text-white font-weight-bold">Danh sách các đợt quyên góp</h1>

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
					<th><c:forEach var="category" items="${list}">
							<li style="margin-bottom: 20px"
								class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center ">
								<div
									class="job-listing-about d-sm-flex custom-width w-100 mx-4 ">
									<div class="job-listing-position custom-width  mb-3 mb-sm-0"
										style="padding: 10px; width: 250px">
										<a
											href="${pageContext.request.contextPath}/public/detail?id=${category.id}">
											<h2 style="display: inline;">${category.name}</h2>
										</a> </br>
										<c:if test="${category.status == 0}">
											<td style="color: #1c7430; font-weight: bold">Mới Tạo</td>
										</c:if>
										<c:if test="${category.status == 1}">
											<td style="color: #1c7430; font-weight: bold">Đang quyên
												góp</td>
										</c:if>
										<c:if test="${category.status == 2}">
											<td style="color: #1c7430; font-weight: bold">Đã kết
												thúc</td>
										</c:if>
										<c:if test="${category.status == 3}">
											<td style="color: #1c7430; font-weight: bold">Đã Đóng</td>
										</c:if>
									</div>
									<div
										class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
										style="padding: 10px;">
										Ngày bắt đầu<br> <strong>${category.startDate}</strong><br>
									</div>
									<div
										class="job-listing-location mb-3 mb-sm-0 custom-width w-10 ml-2"
										style="padding: 10px;">
										Ngày kết thúc<br> <strong>${category.endDate}</strong><br>
									</div>
									<div
										class="job-listing-location mb-3 mb-sm-0 custom-width w-25 ml-2"
										style="padding: 10px;">
										<span class="icon-room"></span> <span>${category.ogzName}</span><br>
										<strong>${category.phoneNumber}</strong><br>
									</div>
									<div class="job-listing-meta custom-width w-20 ml-2">
										<c:if test="${category.status == 1}">
											<p style="margin-top: 20px" class="btn btn-primary py-2"
												data-toggle="modal" data-target="#exampleModalAdd"
												onclick="setCategoryValue(this, '${category.id}')">Quyên
												góp</p>
											<p
												style="margin-top: 20px; background-color: white !important;"
												class="btn py-2">
												<span style="color: white" data-toggle="modal"
													data-target="#exampleModalAdd"
													onclick="setCategoryValue(this, '${category.id}')">Quyên
													góp</span>
											</p>
										</c:if>

									</div>
								</div>

							</li>

							<!------------------- Modal ------------------------------------------------------------------------------------------------------->
							<div class="modal fade" id="exampleModalAdd" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">
												Quyên góp: <span></span>
											</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" modelAttribute="userdonation"
											action="saveUserDonation" id="myForm">
											<div class="modal-body">
												<div class="row">
													<div class="col-12">
														<label for="addname" class="col-form-label">Họ
															tên:</label> <input type="text" class="form-control" id="addname"
															name="name" placeholder="" required> <label
															for="addname" class="col-form-label">Số tiền
															quyên góp:</label> <input type="number" class="form-control"
															placeholder="" id="numberInput" name="money" required>
														<input type="hidden" name="donationId" value=""
															id="category_id"> <label for="addname"
															class="col-form-label">Lời nhắn:</label>
														<textarea rows="10" cols="3" class="form-control"
															name="text"></textarea>
													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Đóng</button>
													<button type="submit" data-toggle="modal"
														data-target="#exampleModal" class="btn btn-primary">Quyên
														góp</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</c:forEach></th>

				</ul>

				<div class="row pagination-wrap">
					<div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
						<!-- Hiển thị phân trang -->
						<c:if test="${count > maxResults}">
							<div>
								<!-- Nút Previous -->
								<c:if test="${offset > 0}">
									<a class="prev"
										href="${pageContext.request.contextPath}/public/home?offset=${offset - maxResults}&maxResults=${maxResults}">Previous</a>
								</c:if>

								<!-- Hiển thị các trang -->
								<c:forEach begin="0" end="${count/maxResults}" varStatus="loop">
									<c:set var="pageNum" value="${loop.index * maxResults}" />
									<c:choose>
										<c:when test="${offset == pageNum}">
											<b>${loop.index + 1}</b>
										</c:when>
										<c:otherwise>
											<a
												href="${pageContext.request.contextPath}/public/home?offset=${pageNum}&maxResults=${maxResults}">${loop.index + 1}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<!-- Nút Next -->
								<c:if test="${offset + maxResults < count}">
									<a class="next"
										href="${pageContext.request.contextPath}/public/home?offset=${offset + maxResults}&maxResults=${maxResults}">Next</a>
								</c:if>
							</div>
						</c:if>

					</div>

					<div class="col-md-6 text-center text-md-right">
						<div class="custom-pagination ml-auto">
							
						</div>
					</div>
				</div>

			</div>
		</section>

</div>
<script>                   
	function setCategoryValue(element, categoryId) {
	document.getElementById('category_id').value = categoryId;
	}
</script>

<script>
    document.getElementById("myForm").addEventListener("submit", function(event) {
        var numberInput = document.getElementById("numberInput").value;
        if (numberInput < 0) {
            document.getElementById("numberError").innerHTML = "Vui lòng nhập số không âm.";
            event.preventDefault(); // Ngăn chặn gửi form nếu giá trị không hợp lệ
        }
    });
</script>

</body>
</html>
