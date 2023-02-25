<%@ page import="cn.scutvk.Utils.ItemUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<%
	// get parameters
	String page_index_str = request.getParameter("page");
	int page_index = 1;
	if (page_index_str != null) {
		page_index = Integer.parseInt(page_index_str);
	}
	// check if page_index has over the max page or over the min page
	if (page_index <= 0) {
		page_index = 1;
	}
	// get the max page
	int max_page = (int) Math.ceil(ItemUtils.get_images_length(true) / 12.0);
	if (page_index > max_page) {
		page_index = max_page;
	}
	String keyword = null;
	if (request.getParameter("keyword") != null) {
		Object keyword_obj = request.getSession().getAttribute("keyword");
		if (keyword_obj != null) {
			keyword = keyword_obj.toString();
		}
	}
	String sort = request.getParameter("sort");
	if (sort == null) {
		sort = "0";
	}
	// set attribute
	request.getSession().setAttribute("page_index", page_index);
	request.getSession().setAttribute("keyword", keyword);
	request.getSession().setAttribute("sort", sort);
%>
<head>
	<meta charset="utf-8">
	<meta username="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- CSS -->
	<link rel="stylesheet" href="css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/select2.min.css">
	<link rel="stylesheet" href="css/main.css">

	<!-- Favicons -->
	<link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/favicon-32x32.png">

	<meta username="description" content="">
	<meta username="keywords" content="">
	<meta username="author" content="Dmitry Volkov">
	<title>Market - SCUTVK</title>

</head>
<body>
	<!-- header -->
	<jsp:include page="headerbar.jsp"></jsp:include>
	<!-- end header -->

	<!-- main content -->
	<main class="main">
		<div class="container">
			<div class="row row--grid">
				<!-- breadcrumb -->
				<div class="col-12">
					<ul class="breadcrumb">
						<li class="breadcrumb__item"><a href="index.jsp">Home</a></li>
						<li class="breadcrumb__item breadcrumb__item--active">Explore</li>
					</ul>
				</div>
				<!-- end breadcrumb -->

				<!-- title -->
				<div class="col-12">
					<div class="main__title main__title--page">
						<h1>探索独家数字资产</h1>
					</div>
				</div>
				<!-- end title -->
			</div>

			<div class="row">
				<!-- sidebar -->
				<div class="col-12 col-xl-3 order-xl-2">
					<div class="filter-wrap">
						<button class="filter-wrap__btn" type="button" data-toggle="collapse" data-target="#collapseFilter" aria-expanded="false" aria-controls="collapseFilter">Open filter</button>

						<div class="collapse filter-wrap__content" id="collapseFilter">
							<!-- filter -->
							<div class="filter">
								<form action="ExploreFilterServlet" method="post">
									<h4 class="filter__title">筛选<button type="button">重置</button></h4>

									<div class="filter__group">
										<label class="filter__label">关键词：</label>
										<input type="text" class="filter__input" placeholder="关键词" name="keyword" value="${keyword}">
									</div>

									<div class="filter__group">
										<label for="sort" class="filter__label">排序：</label>

										<div class="filter__select-wrap">
											<select name="sort" id="sort" class="filter__select">
												<%
													if (sort.equals("0")) {
												%>
													<option value="0" selected="selected">最近发布</option>
													<option value="1">人气最佳</option>
												<%
													} else {
												%>
													<option value="0">最近发布</option>
													<option value="1" selected="selected">人气最佳</option>
												<%
													}
												%>
											</select>
										</div>
									</div>

									<div class="filter__group">
										<button class="filter__btn" type="submit">应用</button>
									</div>
								</form>
							</div>
							<!-- end filter -->
						</div>
					</div>
				</div>
				<!-- end sidebar -->

				<!-- content -->
				<div class="col-12 col-xl-9 order-xl-1">
					<div class="row row--grid">
						<%--	Here's for print the exploreitems 	--%>
						<jsp:include page="publicitemshow/exploreitems.jsp"></jsp:include>
					</div>


					<!-- paginator -->
					<div class="row row--grid">
						<div class="col-12">
							<div class="paginator">
								<span class="paginator__pages"><%=request.getSession().getAttribute("page_items_number")%> from <%=request.getSession().getAttribute("total_items_number")%></span>

								<jsp:include page="publicitemshow/explorepagelist.jsp"></jsp:include>
							</div>
						</div>
					</div>

					<!-- end paginator -->
				</div>
				<!-- end content -->
			</div>	
		</div>
	</main>
	<!-- end main content -->

<!-- footer -->
<jsp:include page="footerbar.jsp"></jsp:include>
<!-- end footer -->

	<!-- JS -->
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/smooth-scrollbar.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
<%
	// remove attributes
	request.getSession().removeAttribute("page_index");
	request.getSession().removeAttribute("request");
	request.getSession().removeAttribute("sort");
	request.getSession().removeAttribute("page_items_number");
	request.getSession().removeAttribute("total_items_number");
%>