<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Travel Architect</title>

<!-- Bootstrap core CSS -->
<link href="bootstrap/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index"><b>T</b>ravel <b>A</b>rchitect</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<c:choose>
						<c:when test="${empty adminUser}">
							<li class="nav-item"><a class="nav-link" href="about">About</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="airReserve">항공예약</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="hotelReserve">호텔예약</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="about">관리자홈</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="airReserve">항공권관리</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="hotelReserve">호텔관리</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="mypage">회원관리</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${empty loginMember && empty adminUser}">
							<li class="nav-item"><a class="nav-link" href="loginForm">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link"
						href="customerService">고객센터</a></li>
				</ul>
			</div>
		</div>
	</nav>