<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

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
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item active" style="background-color: skyblue">
				<div class="carousel-caption d-none d-md-block">
					<h3>여행지 어떻게 갈까?</h3>
					<div class="search-t">
						<form name="formm" method="get">
							<table>
								<colgroup>
									<col width="50%" />
									<col width="50%" />
								</colgroup>
								<tr class="t-n">
									<td colspan='2'>여행지</td>
								</tr>
								<tr>
									<td colspan='2'><input type="search" name="search_text"
										size="35%" placeholder="ex) 홍콩" /></td>
								</tr>
								<tr class="t-n">
									<td>체크인</td>
									<td>체크아웃</td>
								</tr>
								<tr>
									<td><input type="date" value="2019-11-11"/></td>
									<td><input type="date" value="2019-11-13"/></td>
								</tr>
								<tr>
									<td colspan='2' class="t-n">인원</td>
								</tr>
								<tr>
									<td><input type="number" /></td>
								</tr>
							</table>
							<input class="search" type="submit" name="search" value="검색" />
						</form>
					</div>
				</div>
			</div>
			<!-- Slide One - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('img/index2.jpg')">
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
				style="background-image: url('img/index3.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3>잘 곳은 정했니?</h3>
					<div class="button_base b03_skewed_slide_in">
						<div>호텔예약</div>
						<div></div>
						<div onclick="location.href='hotelReserve'">항공예약</div>
					</div>
				</div>
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
	</div>
</header>

<!-- Page Content -->
<div class="container">


	<hr>
	<h3>추천 여행지</h3>
	<div class="clr">
		<c:forEach items="${images}" var="img">
			<div class="imgs" onclick="location.href='#'">
				<img src="${img.path}">
				<div class="img-name">${img.name}</div>
			</div>
		</c:forEach>
	</div>
	<hr>
	

</div>
<!-- /.container -->

<%@ include file="footer.jsp"%>
