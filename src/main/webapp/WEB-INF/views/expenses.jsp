<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div>
    <label class="block font-semibold">Category:</label>
    <select name="category" required class="w-full p-2 border rounded">
        <option disabled selected>Select a Category</option>

        <!-- 🏠 Housing & Utilities -->
        <optgroup label="Housing & Utilities">
            <option value="Rent/Mortgage">Rent / Mortgage</option>
            <option value="Electricity">Electricity</option>
            <option value="Water">Water</option>
            <option value="Gas">Gas</option>
            <option value="Internet">Internet</option>
            <option value="Phone">Phone Bill</option>
            <option value="PropertyTax">Property Tax</option>
            <option value="Maintenance">Home Maintenance</option>
        </optgroup>

        <!-- 🍽️ Food & Groceries -->
        <optgroup label="Food & Groceries">
            <option value="Groceries">Groceries</option>
            <option value="Restaurants">Restaurants</option>
            <option value="FastFood">Fast Food</option>
            <option value="Coffee/Tea">Coffee / Tea</option>
        </optgroup>

        <!-- 🚗 Transportation -->
        <optgroup label="Transportation">
            <option value="Fuel">Fuel</option>
            <option value="PublicTransport">Public Transport</option>
            <option value="Taxi/Uber">Taxi / Uber</option>
            <option value="VehicleMaintenance">Vehicle Maintenance</option>
            <option value="CarInsurance">Car Insurance</option>
            <option value="Parking">Parking</option>
        </optgroup>

        <!-- ❤️ Health & Wellness -->
        <optgroup label="Health & Wellness">
            <option value="MedicalBills">Medical Bills</option>
            <option value="Pharmacy">Pharmacy</option>
            <option value="HealthInsurance">Health Insurance</option>
            <option value="Gym">Gym & Fitness</option>
            <option value="Therapy">Therapy / Counseling</option>
        </optgroup>

        <!-- 💳 Debt & Loans -->
        <optgroup label="Debt & Loans">
            <option value="CreditCardPayments">Credit Card Payments</option>
            <option value="StudentLoan">Student Loan</option>
            <option value="CarLoan">Car Loan</option>
            <option value="Mortgage">Mortgage</option>
            <option value="OtherLoans">Other Loans</option>
        </optgroup>

        <!-- 🎉 Entertainment & Recreation -->
        <optgroup label="Entertainment & Recreation">
            <option value="Movies">Movies</option>
            <option value="Concerts">Concerts</option>
            <option value="Gaming">Gaming</option>
            <option value="Streaming">Streaming Services (Netflix, Spotify, etc.)</option>
            <option value="OutdoorActivities">Outdoor Activities</option>
        </optgroup>

        <!-- 📚 Education & Learning -->
        <optgroup label="Education & Learning">
            <option value="TuitionFees">Tuition Fees</option>
            <option value="OnlineCourses">Online Courses</option>
            <option value="Books">Books</option>
            <option value="SchoolSupplies">School Supplies</option>
        </optgroup>

        <!-- 💰 Savings & Investments -->
        <optgroup label="Savings & Investments">
            <option value="EmergencyFund">Emergency Fund</option>
            <option value="RetirementSavings">Retirement Savings</option>
            <option value="Stocks/MutualFunds">Stocks / Mutual Funds</option>
            <option value="Cryptocurrency">Cryptocurrency</option>
            <option value="FixedDeposits">Fixed Deposits</option>
        </optgroup>

        <!-- 🛍️ Personal Care & Shopping -->
        <optgroup label="Personal Care & Shopping">
            <option value="Clothing">Clothing</option>
            <option value="BeautyProducts">Beauty Products</option>
            <option value="Haircut/Spa">Haircut / Spa</option>
            <option value="Accessories">Accessories</option>
        </optgroup>

        <!-- 🏦 Insurance & Taxes -->
        <optgroup label="Insurance & Taxes">
            <option value="HealthInsurance">Health Insurance</option>
            <option value="CarInsurance">Car Insurance</option>
            <option value="LifeInsurance">Life Insurance</option>
            <option value="IncomeTax">Income Tax</option>
            <option value="PropertyTax">Property Tax</option>
        </optgroup>

        <!-- ✈️ Travel -->
        <optgroup label="Travel">
            <option value="FlightTickets">Flight Tickets</option>
            <option value="Hotel">Hotel / Accommodation</option>
            <option value="TourPackages">Tour Packages</option>
            <option value="LocalTransport">Local Transport</option>
            <option value="TravelInsurance">Travel Insurance</option>
        </optgroup>

        <!-- 🏢 Business Expenses -->
        <optgroup label="Business Expenses">
            <option value="OfficeRent">Office Rent</option>
            <option value="EmployeeSalary">Employee Salary</option>
            <option value="Marketing">Marketing & Advertising</option>
            <option value="Technology">Technology & Software</option>
            <option value="BusinessTravel">Business Travel</option>
            <option value="Legal">Legal & Compliance</option>
        </optgroup>

        <!-- 🏡 Household & Miscellaneous -->
        <optgroup label="Household & Miscellaneous">
            <option value="HomeDecor">Home Decor</option>
            <option value="Furniture">Furniture</option>
            <option value="PetCare">Pet Care</option>
            <option value="Gifts">Gifts</option>
            <option value="Donations">Donations</option>
            <option value="Miscellaneous">Miscellaneous</option>
        </optgroup>

        <!-- Other -->
        <option value="Other">Other</option>
    </select>
</div>
