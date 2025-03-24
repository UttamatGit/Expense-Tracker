<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Expenses</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .card-hover {
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-gray-50">
<div class="min-h-screen flex">
    <!-- Include Sidebar -->
    <jsp:include page="sidebar.jsp"/>

    <!-- Main Content -->
    <div class="flex-1 p-6">
        <div class="max-w-lg mx-auto bg-white p-8 rounded-lg shadow-lg transform transition-all duration-300 hover:shadow-2xl">
            <!-- Form Header with Icon -->
            <div class="text-center mb-6">
                <div class="inline-block bg-blue-100 p-4 rounded-full animate-bounce">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                    </svg>
                </div>
                <h2 class="text-2xl font-bold text-gray-800 mt-4 animate-fade-in-down">Add Expense</h2>
            </div>

            <!-- Form -->
            <form action="saveExpense" method="post" class="space-y-6">
                <!-- Expense Name -->
                <div class="animate-fade-in-up">
                    <label class="block font-semibold text-gray-700 mb-2">Expense Name:</label>
                    <div class="relative">
                        <input type="text" name="expenseName" required class="w-full p-3 pl-10 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-300" placeholder="Enter expense name"/>
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Amount -->
                <div class="animate-fade-in-up">
                    <label class="block font-semibold text-gray-700 mb-2">Amount:</label>
                    <div class="relative">
                        <input type="number" name="amount" step="0.01" required class="w-full p-3 pl-10 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-300" placeholder="Enter amount"/>
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Category -->
                <div class="animate-fade-in-up">
<%--                    <label class="block font-semibold text-gray-700 mb-2">Category:</label>--%>
<%--                    <div class="relative">--%>
<%--                        <select name="category" required class="w-full p-3 pl-10 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-300">--%>
<%--                            <option value="Food">Food</option>--%>
<%--                            <option value="Transport">Transport</option>--%>
<%--                            <option value="Shopping">Shopping</option>--%>
<%--                            <option value="Bills">Bills</option>--%>
<%--                            <option value="Entertainment">Entertainment</option>--%>
<%--                            <option value="Other">Other</option>--%>
<%--                        </select>--%>
<%--                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">--%>
<%--                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">--%>
<%--                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path>--%>
<%--                            </svg>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <jsp:include page="expenses.jsp"/>
                </div>

                <!-- Date -->
                <div class="animate-fade-in-up">
                    <label class="block font-semibold text-gray-700 mb-2">Date:</label>
                    <div class="relative">
                        <input type="date" name="date" required class="w-full p-3 pl-10 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-300"/>
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Notes -->
                <div class="animate-fade-in-up">
                    <label class="block font-semibold text-gray-700 mb-2">Notes:</label>
                    <textarea name="notes" rows="3" class="w-full p-3 border rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-300" placeholder="Add notes (optional)"></textarea>
                </div>

                <!-- Submit Button -->
                <div class="animate-fade-in-up">
                    <button type="submit" class="w-full bg-blue-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-all duration-300 transform hover:scale-105">
                        Add Expense
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>