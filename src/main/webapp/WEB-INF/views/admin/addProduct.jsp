<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품추가하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/semiProject/resources/adminAssets/css/styles.css"
	rel="stylesheet" />
<script>
	$(function() {

		// 이벤트
		$('#category').change(
				function() {

					$
							.ajax({
								type : 'POST',
								url : "changeCategory.do?categoryCode="
										+ $(this).val(),
								dataType : 'text',
								success : function(result) {
									console.log(result);
									//-----------------------------------
									$('#dCategoryCode').empty();

									var cateList = eval(result);

									for (let i = 0; i < cateList.length; i++) {
										$('#dCategoryCode').append(
												"<option value=" +cateList[i].dCategoryCode  + ">"
														+ cateList[i].dName
														+ "</option>");
									}

								},
								error : function(err) {
									alert('에러발생')
									console.log(err)
								}

							})

				})
	})
</script>
<body>

	<div class="jumbotron">
		<br />
		<h1 class="display-4">Product</h1>
		<p class="lead">상품추가</p>
		<hr class="my-4">
	</div>


	<form action="saveProduct.do" name="frm" id='frm' method="post"
		enctype="multipart/form-data">
		<table>

			<tr>
				<td bgcolor="lightgrey">상품명</td>
				<td align="left"><input type="text" name='pName' /></td>
			</tr>


			<tr>
				<td>상품가격</td>
				<td align="left"><input type="text" name='pPrice' /></td>
			</tr>

			<tr>
				<td bgcolor="lightgrey">상품상세설명</td>
				<td align="left"><input type="text" name='pDetail' /></td>
			</tr>

			<tr>
				<td>상품수량</td>
				<td align="left"><input type="text" name="pCount" /></td>
			</tr>

			<tr>
				<td bgcolor="lightgrey">상품색깔</td>
				<td align="left"><input type="text" name="pColor" /></td>
			</tr>



			<tr>
				<td>카테고리</td>
				<td><select name="categoryCode" id="category">
						<option value="">전체</option>
						<c:forEach items="${cateList}" var="cate">

							<c:choose>
								<c:when test="${cate.categoryCode eq product.categoryCode }">
									<option value='${cate.categoryCode }'>${cate.categoryName }</option>
								</c:when>
								<c:otherwise>
									<%-- <c:if test="${cate.categoryCode ne product.categoryCode }"> --%>
									<option value='${cate.categoryCode }'>${cate.categoryName }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</select> <select name="dCategoryCode" id="dCategoryCode">
						<c:forEach items="${dcateList }" var="dcate">
							<c:choose>
								<c:when test="${dcate.categoryCode eq cate.categoryCode }">
									<option value='${dcate.categoryCode }'>${dcate.dName }</option>
								</c:when>
								<c:otherwise>
									<option value='${dcate.categoryCode }'>${dcate.dName }</option>

								</c:otherwise>
							</c:choose>
						</c:forEach>

				</select></td>
			</tr>

			<tr>
				<td bgcolor="lightgrey">파일추가</td>
				<td align="left"><input type="file" maxlength="60" size="40"
					name="file"></td>

			</tr>


		</table>

		<div>
			<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="상품추가" class="btn btn-dark" id='btn' />
		</div>

	</form>

</body>
</html>
