<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Report Application</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background-color: #f4f6f9;
}

.card {
	border-radius: 12px;
}

.table th {
	text-align: center;
	vertical-align: middle;
}

.table td {
	text-align: center;
	vertical-align: middle;
}

h2 {
	font-weight: bold;
}

.form-label {
	font-weight: 600;
}
</style>

</head>

<body>

	<div class="container mt-5">

		<!-- Heading -->
		<div class="text-center mb-4">
			<h2 class="text-primary">
				<i class="bi bi-file-earmark-bar-graph-fill"></i> Report
				Application
			</h2>
			<p class="text-muted">Search Citizen Plan Reports</p>
		</div>

		<!-- Search Card -->

		<div class="card shadow-lg">

			<div class="card-header bg-primary text-white">
				<h5 class="mb-0">
					<i class="bi bi-search"></i> Search Filters
				</h5>
			</div>

			<div class="card-body">

				<form:form action="search" method="post"
					modelAttribute="search">

					<div class="row">

						<div class="col-md-4 mb-3">

							<label class="form-label">Plan Name</label>

							<form:select path="planName" cssClass="form-select">

								<form:option value="">-- Select --</form:option>

								<form:options items="${names}" />

							</form:select>

						</div>

						<div class="col-md-4 mb-3">

							<label class="form-label">Plan Status</label>

							<form:select path="planStatus" cssClass="form-select">

								<form:option value="">-- Select --</form:option>

								<form:options items="${status}" />

							</form:select>

						</div>

						<div class="col-md-4 mb-3">

							<label class="form-label">Gender</label>

							<form:select path="gender" cssClass="form-select">

								<form:option value="">-- Select --</form:option>

								<form:option value="Male">Male</form:option>

								<form:option value="Female">Female</form:option>

							</form:select>

						</div>

					</div>

					<div class="row">

						<div class="col-md-6 mb-3">

							<label class="form-label">Start Date</label>

							<form:input path="startDate" type="date"
								cssClass="form-control" />

						</div>

						<div class="col-md-6 mb-3">

							<label class="form-label">End Date</label>

							<form:input path="endDate" type="date"
								cssClass="form-control" />

						</div>

					</div>

					<div class="text-center mt-3">

						<button type="submit" class="btn btn-primary px-4">

							<i class="bi bi-search"></i> Search

						</button>

						<a href="/" class="btn btn-secondary px-4">

							<i class="bi bi-arrow-clockwise"></i> Reset

						</a>

					</div>

				</form:form>

			</div>

		</div>

		<!-- Result Table -->

		<div class="card shadow-lg mt-4">

			<div class="card-header bg-success text-white">

				<h5 class="mb-0">

					<i class="bi bi-table"></i> Search Results

				</h5>

			</div>

			<div class="card-body">

				<div class="table-responsive">

					<table
						class="table table-bordered table-hover table-striped align-middle">

						<thead class="table-dark">

							<tr>

								<th>S.No</th>

								<th>Holder Name</th>

								<th>Gender</th>

								<th>Plan Name</th>

								<th>Plan Status</th>

								<th>Start Date</th>

								<th>End Date</th>

								<th>Benefit Amount</th>

							</tr>

						</thead>

						<tbody>

							<c:choose>

								<c:when test="${not empty plans}">

									<c:forEach items="${plans}" var="plan"
										varStatus="index">

										<tr>

											<td>${index.count}</td>

											<td>${plan.citizenName}</td>

											<td>${plan.gender}</td>

											<td>${plan.planName}</td>

											<td>${plan.planStatus}</td>

											<td>${plan.planStartDate}</td>

											<td>${plan.planEndDate}</td>

											<td>₹ ${plan.benefitAmt}</td>

										</tr>

									</c:forEach>

								</c:when>

								<c:otherwise>

									<tr>

										<td colspan="8" class="text-center text-danger">

											No Records Found

										</td>

									</tr>

								</c:otherwise>

							</c:choose>

						</tbody>

					</table>

				</div>

			</div>

		</div>

		<!-- Export Buttons -->

		<div class="text-end mt-4 mb-5">

			<a href="excel" class="btn btn-success">

				<i class="bi bi-file-earmark-excel"></i> Export Excel

			</a>

			<a href="pdf" class="btn btn-danger">

				<i class="bi bi-file-earmark-pdf"></i> Export PDF

			</a>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>  