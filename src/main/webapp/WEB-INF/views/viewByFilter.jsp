<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>View Expenses</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-50">
<div class="min-h-screen flex">
    <!-- Include Sidebar -->
    <jsp:include page="sidebar.jsp"/>

    <!-- Main Content -->
    <div class="flex-1 p-6">
        <div class="max-w-7xl mx-auto">
            <!-- Page Header -->
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-gray-800">View Expenses</h1>
                <p class="text-gray-600 mt-2">Filter and view your expenses by date, year, or category.</p>
            </div>

            <!-- Filter Section -->
            <div class="bg-white p-6 rounded-lg shadow-md mb-8">
                <h2 class="text-xl font-semibold text-gray-800 mb-6">Filter Expenses</h2>
                <form action="viewExpFilter" method="post" class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <!-- Filter by Date -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Filter by Date:</label>
                        <div class="relative">
                            <input type="date" name="date"
                                   class="w-full p-2.5 pl-10 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200"
                                   value="${selectedDate != null ? selectedDate : ''}"/>
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Filter by Year -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Filter by Year:</label>
                        <div class="relative">
                            <select name="year"
                                    class="w-full p-2.5 pl-10 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200">
                                <option value="">-- Select Year --</option>
                                <option value="2025" ${selectedYear == '2025' ? 'selected' : ''}>2025</option>
                                <option value="2024" ${selectedYear == '2024' ? 'selected' : ''}>2024</option>
                                <option value="2023" ${selectedYear == '2023' ? 'selected' : ''}>2023</option>
                                <option value="2022" ${selectedYear == '2022' ? 'selected' : ''}>2022</option>
                            </select>
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Filter by Category -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Filter by Category:</label>
                        <div class="relative">
                            <select name="category"
                                    class="w-full p-2.5 pl-10 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200">
                                <option value="">-- Select Category --</option>
                                <option value="Food" ${selectedCategory == 'Food' ? 'selected' : ''}>Food</option>
                                <option value="Transport" ${selectedCategory == 'Transport' ? 'selected' : ''}>Transport</option>
                                <option value="Shopping" ${selectedCategory == 'Shopping' ? 'selected' : ''}>Shopping</option>
                                <option value="Bills" ${selectedCategory == 'Bills' ? 'selected' : ''}>Bills</option>
                                <option value="Entertainment" ${selectedCategory == 'Entertainment' ? 'selected' : ''}>Entertainment</option>
                                <option value="Other" ${selectedCategory == 'Other' ? 'selected' : ''}>Other</option>
                            </select>
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="flex items-end">
                        <button type="submit"
                                class="w-full bg-blue-600 text-white px-6 py-2.5 rounded-lg font-semibold hover:bg-blue-700 transition-all duration-200 transform hover:scale-105">
                            Apply Filters
                        </button>
                    </div>
                </form>
            </div>

            <!-- Expense List Section -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-semibold text-gray-800 mb-6">Expense List</h2>
                <c:if test="${not empty filteredExpenses}">
                    <div class="space-y-4">
                        <c:forEach var="expense" items="${filteredExpenses}">
                            <div class="flex justify-between items-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-all duration-200">
                                <div>
                                    <h3 class="text-lg font-semibold text-gray-800">${expense.expenseName}</h3>
                                    <p class="text-sm text-gray-600">$${expense.amount} - ${expense.category} - ${expense.date}</p>
                                </div>
                                <div class="flex space-x-4">
                                    <!-- Edit Button -->
                                    <button class="text-blue-600 hover:text-blue-800 transition duration-200">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2 17l1.5 1.5L6 16m-4-4l1.5-1.5L6 12m8-8l1.5 1.5L16 6m-4-4l1.5-1.5L16 2m0 20l1.5-1.5L16 18m4-4l1.5 1.5L16 12"/>
                                        </svg>
                                    </button>
                                    <!-- Delete Button -->
                                    <button class="text-red-600 hover:text-red-800 transition duration-200">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${empty filteredExpenses}">
                    <p class="text-gray-600 text-center py-6">No expenses match the filter criteria.</p>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>