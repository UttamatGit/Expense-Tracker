<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Expense Tracker Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
    <jsp:include page="sidebar.jsp" flush="true"/>

    <div class="flex-1 p-6">
        <div class="max-w-4xl mx-auto">
            <div class="bg-gradient-to-r from-blue-600 to-blue-500 p-8 rounded-lg shadow-lg text-center">
                <h1 class="text-4xl font-bold text-white mb-4">Welcome to Expense Tracker</h1>
                <p class="text-blue-100 mb-6 text-lg">Manage your expenses efficiently with our tools.</p>
                <a href="addExpenses" class="inline-block bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-blue-50 transition duration-300">
                    Get Started
                </a>
            </div>

            <!-- Quick Stats Section -->
            <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h2 class="text-xl font-semibold text-gray-800 mb-2">Total Expenses</h2>
                    <p class="text-gray-600 text-2xl font-bold">₹${totalExpenses}</p>
                </div>

                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h2 class="text-xl font-semibold text-gray-800 mb-2">Monthly Summary</h2>
                    <p class="text-gray-600 text-2xl font-bold">₹${monthlyExpenses}</p>
                </div>

                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h2 class="text-xl font-semibold text-gray-800 mb-2">Top Category</h2>
                    <p class="text-gray-600 text-2xl font-bold">${topCategory}</p>
                </div>
            </div>

            <!-- Charts Section -->
            <div class="mt-12 grid grid-cols-1 md:grid-cols-2 gap-8">
                <!-- Expense Breakdown Pie Chart -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h2 class="text-xl font-semibold text-gray-800 mb-4">Expense Breakdown</h2>
                    <canvas id="expenseChart"></canvas>
                </div>

                <!-- Monthly Expense Bar Chart -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h2 class="text-xl font-semibold text-gray-800 mb-4">Monthly Expenses</h2>
                    <canvas id="monthlyChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Expense Breakdown (Pie Chart)
    var ctx1 = document.getElementById('expenseChart').getContext('2d');
    var expenseChart = new Chart(ctx1, {
        type: 'pie',
        data: {
            labels: ['Food', 'Transport', 'Bills', 'Entertainment', 'Others'],
            datasets: [{
                label: 'Expense Breakdown',
                data: [
                    ${categoryExpenses["Food"] != null ? categoryExpenses["Food"] : 0},
                    ${categoryExpenses["Transport"] != null ? categoryExpenses["Transport"] : 0},
                    ${categoryExpenses["Bills"] != null ? categoryExpenses["Bills"] : 0},
                    ${categoryExpenses["Entertainment"] != null ? categoryExpenses["Entertainment"] : 0},
                    ${categoryExpenses["Others"] != null ? categoryExpenses["Others"] : 0}
                ],
                backgroundColor: ['#4CAF50', '#FF9800', '#F44336', '#3F51B5', '#9C27B0']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    position: 'top',
                    labels: { color: '#333', font: { size: 14 } }
                },
                tooltip: {
                    enabled: true,
                    callbacks: {
                        label: function(tooltipItem) {
                            return tooltipItem.label + ': ₹' + tooltipItem.raw;
                        }
                    }
                }
            }
        }

    });
    // Append '4d' to the colors (alpha channel), except for the hovered index
    function handleHover(evt, item, legend) {
        legend.chart.data.datasets[0].backgroundColor.forEach((color, index, colors) => {
            colors[index] = index === item.index || color.length === 9 ? color : color + '4D';
        });
        legend.chart.update();
    }

    // Removes the alpha channel from background colors
    function handleLeave(evt, item, legend) {
        legend.chart.data.datasets[0].backgroundColor.forEach((color, index, colors) => {
            colors[index] = color.length === 9 ? color.slice(0, -2) : color;
        });
        legend.chart.update();
    }

    // Ensure `monthlyExpenseList` is an array
    const monthlyData = ${monthlyExpenseList != null ? monthlyExpenseList : "[]"};
    const totalDuration = 4000; // Animation duration in ms
    const delayBetweenPoints = totalDuration / monthlyData.length;

    const previousY = (ctx) =>
        ctx.index === 0
            ? ctx.chart.scales.y.getPixelForValue(monthlyData[0])
            : ctx.chart.getDatasetMeta(ctx.datasetIndex).data[ctx.index - 1].getProps(['y'], true).y;

    const animation = {
        x: {
            type: 'number',
            easing: 'linear',
            duration: delayBetweenPoints,
            from: NaN, // The point is initially skipped
            delay(ctx) {
                if (ctx.type !== 'data' || ctx.xStarted) return 0;
                ctx.xStarted = true;
                return ctx.index * delayBetweenPoints;
            }
        },
        y: {
            type: 'number',
            easing: 'linear',
            duration: delayBetweenPoints,
            from: previousY,
            delay(ctx) {
                if (ctx.type !== 'data' || ctx.yStarted) return 0;
                ctx.yStarted = true;
                return ctx.index * delayBetweenPoints;
            }
        }
    };

    // Monthly Expenses (Animated Line Chart)
    var ctx2 = document.getElementById('monthlyChart').getContext('2d');
    var monthlyChart = new Chart(ctx2, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            datasets: [{
                label: 'Monthly Expenses (₹)',
                data: monthlyData,
                borderColor: '#2196F3',
                borderWidth: 2,
                radius: 4,
                pointBackgroundColor: '#2196F3',
                fill: false,
                tension: 0.4
            }]
        },
        options: {
            animation,
            responsive: true,
            interaction: { intersect: false },
            plugins: {
                legend: { display: true, position: 'top' }
            },
            scales: {
                x: { type: 'category' },
                y: { beginAtZero: true }
            }
        }
    });
</script>

</body>
</html>
