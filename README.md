
# Expense Tracker

## Overview

The **Expense Tracker** is a web application designed to help users manage and track their daily, monthly, and categorized expenses efficiently. The application provides an intuitive dashboard, expense analytics, category breakdowns, and monthly summaries.

### Features
- **User Authentication**: Log in to securely track your personal expenses.
- **Expense Management**: Add, update, delete, and view expenses.
- **Dashboard Analytics**: Visual representation of monthly expenses, top categories, and overall spending.
- **Category Breakdown**: View your expenses categorized by types like Food, Transport, Bills, etc.
- **Monthly Overview**: Track monthly expense trends with bar charts and pie charts.
- **Data Filtering**: Filter and search for expenses by category, date, or amount.

## Technologies Used
- **Backend**: Java, Spring Boot, Spring MVC, Spring Data JPA
- **Frontend**: JSP, HTML, CSS, Tailwind CSS, Chart.js
- **Database**: MySQL (or any other relational database)
- **Others**: Jackson for JSON processing

## Setup and Installation

### Prerequisites
- **Java**: Version 11 or higher
- **Maven**: For dependency management
- **Database**: MySQL (or another relational database, modify `application.properties` if using a different database)
- **IDE**: IntelliJ IDEA, Eclipse, or any Java IDE

### Clone the Repository
Clone the project to your local machine using the following command:

```bash
git clone https://github.com/yourusername/expense-tracker.git
```

### Build the Project
Navigate to the project directory and run the following Maven command to build the project:

```bash
mvn clean install
```

### Configuration

1. **Database Configuration**: 
   Modify the `application.properties` file to set up your database connection:

   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/expense_tracker_db
   spring.datasource.username=root
   spring.datasource.password=yourpassword
   spring.jpa.hibernate.ddl-auto=update
   spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
   ```

2. **Application Properties**:
   Customize any other properties in the `application.properties` file as needed, such as server port, logging, etc.

### Running the Application
To run the Spring Boot application, execute the following command:

```bash
mvn spring-boot:run
```

By default, the application will run on **http://localhost:8080**. You can access the Expense Tracker application by navigating to this URL in your browser.

## Usage

1. **Login**: 
   - When the application is accessed for the first time, register an account or log in using existing credentials.
   
2. **Dashboard**: 
   - After logging in, the user is directed to the dashboard, where they can see an overview of their expenses, monthly summary, and top category.
   
3. **Managing Expenses**:
   - **Add Expense**: Add new expenses by providing the category, amount, date, and description.
   - **View Expenses**: View the list of expenses with details like name, category, amount, and date.
   - **Edit/Delete**: Update or delete expenses as required.

4. **Analytics**: 
   - Track your monthly spending with a visual chart and breakdown of different categories.
   - Get detailed reports on your spending trends.

## Screenshots

**Log-In**:  
![Main Screenshot](https://github.com/UttamatGit/Expense-Tracker/blob/main/Screenshot%201%20(1).png?raw=true)

**Add Expense**:  
![Add Expense Screenshot](https://github.com/UttamatGit/Expense-Tracker/blob/main/Screenshot%201%20(2).png?raw=true)

**View Expenses**:  
![View Expenses Screenshot](https://github.com/UttamatGit/Expense-Tracker/blob/main/Screenshot%201%20(3).png?raw=true)


## Contributing

We welcome contributions! If you'd like to improve this project, follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make changes and commit them (`git commit -am 'Add new feature'`).
4. Push to your forked repository (`git push origin feature-branch`).
5. Create a new pull request.

## Acknowledgements

- **Spring Boot**: For providing a robust framework to build the application.
- **Chart.js**: For rendering interactive charts to visualize data.
- **Tailwind CSS**: For building modern and responsive layouts.
- **MySQL**: For the relational database management system.
