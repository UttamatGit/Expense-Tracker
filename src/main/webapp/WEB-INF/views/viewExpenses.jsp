<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>View Expenses</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="bg-gradient-to-r from-gray-100 via-gray-200 to-gray-100 text-gray-900">
<div class="min-h-screen flex">
    <jsp:include page="sidebar.jsp"/>
    <div class="flex-1 p-8">
        <!-- Header Section -->
        <div class="mb-8 text-center">
            <h1 class="text-4xl font-extrabold text-blue-700">My Expense Dashboard</h1>
            <p class="mt-2 text-lg text-gray-600">Track, sort, and manage your expenses seamlessly.</p>
        </div>

        <!-- Main Card -->
        <div class="bg-white rounded-xl shadow-2xl overflow-hidden fade-in">
            <div class="p-6">
                <h2 class="text-3xl font-bold text-blue-600 mb-4 text-center">View Expenses</h2>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-blue-600">
                        <tr>
                            <th class="px-6 py-3 text-left text-lg font-semibold text-white">
                                <a href="viewExp?sortField=expenseName&sortDir=${sortField == 'expenseName' && sortDir == 'asc' ? 'desc' : 'asc'}" class="hover:underline">
                                    Expense Name
                                </a>
                            </th>
                            <th class="px-6 py-3 text-left text-lg font-semibold text-white">
                                <a href="viewExp?sortField=amount&sortDir=${sortField == 'amount' && sortDir == 'asc' ? 'desc' : 'asc'}" class="hover:underline">
                                    Amount (₹)
                                </a>
                            </th>
                            <th class="px-6 py-3 text-left text-lg font-semibold text-white">
                                <a href="viewExp?sortField=category&sortDir=${sortField == 'category' && sortDir == 'asc' ? 'desc' : 'asc'}" class="hover:underline">
                                    Category
                                </a>
                            </th>
                            <th class="px-6 py-3 text-left text-lg font-semibold text-white">
                                <a href="viewExp?sortField=date&sortDir=${sortField == 'date' && sortDir == 'asc' ? 'desc' : 'asc'}" class="hover:underline">
                                    Date
                                </a>
                            </th>
                            <th class="px-6 py-3 text-left text-lg font-semibold text-white">Notes</th>
                            <th class="px-6 py-3 text-center text-lg font-semibold text-white">Actions</th>
                        </tr>
                        </thead>
                        <tbody class="bg-gray-50 divide-y divide-gray-200">
                        <c:forEach var="expense" items="${expenses}">
                            <tr class="hover:bg-red-100 transition duration-300">
                                <td class="px-6 py-4 text-gray-800 font-medium">${expense.expenseName}</td>
                                <td class="px-6 py-4 text-gray-800">₹${expense.amount}</td>
                                <td class="px-6 py-4 text-gray-800">${expense.category}</td>
                                <td class="px-6 py-4 text-gray-800">${expense.date}</td>
                                <td class="px-6 py-4 text-gray-700">${expense.notes}</td>
                                <td class="px-6 py-4 flex justify-center space-x-4">
                                    <a href="updateExpenses?id=${expense.expID}" class="text-yellow-500 hover:text-yellow-600">
                                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"/>
                                        </svg>
                                    </a>
                                    <a href="deleteExpenses?id=${expense.expID}" class="text-red-500 hover:text-red-600" onclick="return confirm('Are you sure you want to delete this expense?');">
                                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                        </svg>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <c:if test="${empty expenses}">
                    <p class="mt-6 text-gray-500 text-center">No expenses found.</p>
                </c:if>
            </div>
            <div class="bg-blue-50 p-4 border-t flex justify-between items-center">
                <p class="text-xl font-semibold text-gray-800">
                    Total Expense: <span class="text-blue-600">₹${totalExpense}</span>
                </p>
                <p class="text-xl font-semibold text-gray-800">
                    Number of Expenses: <span class="text-blue-600">${expenseCount}</span>
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
