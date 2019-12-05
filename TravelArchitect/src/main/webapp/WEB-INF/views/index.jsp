<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('img/index1.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>여행 떠나볼래?</h3>
						<div class="button_base b03_skewed_slide_in">
							<div>항공예약</div>
							<div></div>
							<div onclick="location.href='airReserve'">항공예약</div>
						</div>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('img/index2.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>잘 곳은 정했니?</h3>
						<div class="button_base b03_skewed_slide_in">
							<div>호텔예약</div>
							<div></div>
							<div onclick="location.href='hotelReserve'">항공예약</div>
						</div>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<!-- <div class="carousel-item"
					style="background-image: url('https://placeimg.com/1900/1080/any')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Third Slide</h3>
						<p>This is a description for the third slide.</p>
					</div>
				</div> -->
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		
		<hr>

		<!-- Call to Action Section -->
		<div class="row mb-4">
			<div class="col-md-8">
				<h3>Contact Details</h3>
				<p>Phone Number: +82 10 1234 1111<br>
				Email: dddd@email.com<br>
				Website</p>
			</div>
			<div class="col-md-4">
				<a class="btn btn-lg btn-secondary btn-block" href="#">Call to
					Action</a>
			</div>
			
			<c:forEach items="${images}" var="img">
				<div><img src="${img.path}"><div>${img.img_name}</div></div>
			</c:forEach>
		</div>
		
	</div>
	<!-- /.container -->

<%@ include file="footer.jsp" %>
