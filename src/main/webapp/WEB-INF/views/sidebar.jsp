<div class="sidebar bg-gradient-to-b from-blue-600 to-blue-500 text-white shadow-lg flex flex-col">
    <div class="p-4 text-center">
        <h1 class="text-2xl font-bold">Expense Tracker</h1>
    </div>
    <nav class="flex-1 p-4">
        <ul class="space-y-4">
            <li>
                <a href="dashboard"
                   class="flex items-center p-2 rounded-lg hover:bg-blue-700 transition duration-300">
                    <div class="menu-icon text-blue-200">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 9.5L12 3l9 6.5V20a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5z"></path>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 21V12h6v9"></path>
                        </svg>

                    </div>
                    <span class="menu-text ml-3">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="addExpenses"
                   class="flex items-center p-2 rounded-lg hover:bg-blue-700 transition duration-300">
                    <div class="menu-icon text-blue-200">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                             stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M12 4v16m8-8H4"></path>
                        </svg>
                    </div>
                    <span class="menu-text ml-3">Add Expense</span>
                </a>
            </li>
            <li>
                <a href="viewExp" class="flex items-center p-2 rounded-lg hover:bg-blue-700 transition duration-300">
                    <div class="menu-icon text-green-200">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                             stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M2 17l1.5 1.5L6 16m-4-4l1.5-1.5L6 12m8-8l1.5 1.5L16 6m-4-4l1.5-1.5L16 2m0 20l1.5-1.5L16 18m4-4l1.5 1.5L16 12"></path>
                        </svg>
                    </div>
                    <span class="menu-text ml-3">View Expenses</span>
                </a>
            </li>
<%--            <li>--%>
<%--                <a href="updateExpenses" class="flex items-center p-2 rounded-lg hover:bg-blue-700 transition duration-300">--%>
<%--                    <div class="menu-icon text-yellow-200">--%>
<%--                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"--%>
<%--                             stroke="currentColor">--%>
<%--                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"--%>
<%--                                  d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>--%>
<%--                        </svg>--%>
<%--                    </div>--%>
<%--                    <span class="menu-text ml-3">Update Expense</span>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                <a href="deleteExpenses" class="flex items-center p-2 rounded-lg hover:bg-blue-700 transition duration-300">--%>
<%--                    <div class="menu-icon text-red-200">--%>
<%--                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"--%>
<%--                             stroke="currentColor">--%>
<%--                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"--%>
<%--                                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>--%>
<%--                        </svg>--%>
<%--                    </div>--%>
<%--                    <span class="menu-text ml-3">Delete Expense</span>--%>
<%--                </a>--%>
<%--            </li>--%>
            <li>
                <a href="viewExpFilter" class="flex items-center p-2 rounded-lg hover:bg-blue-700 transition duration-300">
                    <div class="menu-icon text-purple-200">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                             stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                    </div>
                    <span class="menu-text ml-3">View Expenses by Filter</span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="p-4">
        <a href="logout" class="flex items-center p-2 rounded-lg hover:bg-blue-700 transition duration-300">
            <div class="menu-icon text-red-200">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                     stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                </svg>
            </div>
            <span class="menu-text ml-3">Logout</span>
        </a>
    </div>
</div>