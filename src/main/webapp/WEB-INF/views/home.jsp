<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Expense Tracker</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Framer Motion -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/framer-motion/10.12.6/framer-motion.umd.min.js"></script>
    <!-- Custom Styles -->
    <link rel="stylesheet" href="<c:url value='/resources/css/styles.css'/>">
</head>
<body>
<div class="card fade-in">
    <h2 class="text-2xl font-semibold text-center text-white">Welcome Back</h2>
    <p class="text-center text-gray-300 mb-4">Login to continue</p>
    <form action="login" method="POST">
        <div>
            <label class="text-white text-sm">Email</label>
            <input type="email" id="email" name="email" required class="input-field">
        </div>
        <div class="mt-4">
            <label class="text-white text-sm">Password</label>
            <input type="password" id="password" name="password" required class="input-field">
        </div>
        <c:if test="${not empty error}">
            <p style="color: red; text-align: center;">${error}</p>
        </c:if>
        <div class="flex items-center justify-between mt-4 text-gray-300 text-sm">
            <label class="flex items-center">
                <input type="checkbox" class="mr-2"> Remember me
            </label>
            <a href="#" class="hover:text-blue-400">Forgot password?</a>
        </div>
        <button type="submit" class="btn mt-6">Login</button>
    </form>
    <p class="mt-4 text-center text-gray-300 text-sm">
        Don't have an account? <a href="registration" class="text-blue-400 hover:text-blue-500">Sign up</a>
    </p>
</div>
<!-- Custom JavaScript -->
<script src="<c:url value='/resources/js/scriptJS.js'/>"></script>
</body>
</html>
