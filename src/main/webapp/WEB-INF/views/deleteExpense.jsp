<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Delete Your Expenses</title>
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
    <div class="max-w-lg mx-auto bg-white p-8 rounded-lg shadow-lg transform transition-all duration-300 hover:shadow-2xl">
      <!-- Form Header with Icon -->
      <div class="text-center mb-6">
        <div class="inline-block bg-red-100 p-4 rounded-full animate-bounce">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-red-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
          </svg>
        </div>
        <h2 class="text-2xl font-bold text-gray-800 mt-4 animate-fade-in-down">Delete Expense</h2>
        <p class="text-gray-600 mt-2 animate-fade-in-up">Are you sure you want to delete this expense? This action cannot be undone.</p>
      </div>

      <!-- Expense Details -->
      <div class="space-y-4 animate-fade-in-up">
        <div>
          <label class="block font-semibold text-gray-700">Expense Name:</label>
          <p class="text-gray-600">Groceries</p>
        </div>
        <div>
          <label class="block font-semibold text-gray-700">Amount:</label>
          <p class="text-gray-600">$50.00</p>
        </div>
        <div>
          <label class="block font-semibold text-gray-700">Category:</label>
          <p class="text-gray-600">Food</p>
        </div>
        <div>
          <label class="block font-semibold text-gray-700">Date:</label>
          <p class="text-gray-600">2025-02-23</p>
        </div>
        <div>
          <label class="block font-semibold text-gray-700">Notes:</label>
          <p class="text-gray-600">Weekly groceries for the family.</p>
        </div>
      </div>

      <!-- Confirmation Buttons -->
      <div class="mt-8 flex justify-between animate-fade-in-up">
        <a href="dashboard.jsp" class="bg-gray-500 text-white px-6 py-3 rounded-lg font-semibold hover:bg-gray-600 transition-all duration-300 transform hover:scale-105">
          Cancel
        </a>
        <button type="submit" class="bg-red-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-red-700 transition-all duration-300 transform hover:scale-105">
          Delete Expense
        </button>
      </div>
    </div>
  </div>
</div>
</body>
</html>