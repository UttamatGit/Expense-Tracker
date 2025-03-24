<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Expense Tracker</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/styles.css'/>">

</head>
<body class="flex items-center justify-center min-h-screen bg-black bg-opacity-50">

<div class="card fade-in p-8 w-full max-w-md text-white">
    <h2 class="text-2xl font-bold text-center mb-6">Create an Account</h2>

    <form action="GetRegistered" method="post" class="space-y-4">

        <!-- Full Name -->
        <div>
            <label for="fullName" class="block font-medium">Full Name</label>
            <input type="text" id="fullName" name="fullName" class="w-full px-4 py-2 bg-transparent border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" required>
        </div>

        <!-- Email -->
        <div>
            <label for="email" class="block font-medium">Email Address</label>
            <input type="email" id="email" name="email" class="w-full px-4 py-2 bg-transparent border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" required>
        </div>

        <!-- Phone -->
        <div>
            <label for="phone" class="block font-medium">Phone Number</label>
            <input type="tel" id="phone" name="phone" class="w-full px-4 py-2 bg-transparent border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" required>
        </div>

        <!-- Password -->
        <div>
            <label for="password" class="block font-medium">Password</label>
            <input type="password" id="password" name="password" class="w-full px-4 py-2 bg-transparent border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" required>
        </div>

        <!-- Account Type -->
        <div>
            <label for="accountType" class="block font-medium">Account Type</label>
            <select id="accountType" name="accountType" class="w-full px-4 py-2 border bg-black opacity-40 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" required>
                <option value="personal">Personal</option>
                <option value="business">Business</option>
            </select>
        </div>

        <!-- Register Button -->
        <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 transition duration-300">
            Register
        </button>

        <!-- Login Link -->
        <p class="text-center mt-4">Already have an account?
            <a href="backLog" class="text-blue-300 hover:underline">Login</a>
        </p>

    </form>
</div>
<script src="<c:url value='/resources/js/scriptJS.js'/>"></script>
</body>
</html>
