package app.expensetracker.Repos;

import app.expensetracker.Model.Expense;
import app.expensetracker.Model.User;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ExpenseRepository extends JpaRepository<Expense,Long>, JpaSpecificationExecutor<Expense> {
    // Basic method to get all expenses for a specific user.
    List<Expense> findByUser(User user);

    List<Expense> findByUser(User user, Sort sort);

    // Retrieve expenses for a user on a specific date.
    List<Expense> findByUserAndDate(User user, LocalDate date);

    // Retrieve expenses for a user between two dates.
    List<Expense> findByUserAndDateBetween(User user, LocalDate startDate, LocalDate endDate);

    // Retrieve expenses for a user that match a specific category.
    List<Expense> findByUserAndCategory(User user, String category);

    // Default method to filter by year using the date range.
    default List<Expense> findByUserAndYear(User user, int year) {
        LocalDate start = LocalDate.of(year, 1, 1);
        LocalDate end = LocalDate.of(year, 12, 31);
        return findByUserAndDateBetween(user, start, end);
    }
    @Query("SELECT COALESCE(SUM(e.amount), 0) FROM Expense e")
    double getTotalExpenses();

    @Query("SELECT COALESCE(SUM(e.amount), 0) FROM Expense e WHERE MONTH(e.date) = MONTH(CURRENT_DATE)")
    double getMonthlyExpenses();

    @Query("SELECT e.category FROM Expense e GROUP BY e.category ORDER BY SUM(e.amount) DESC LIMIT 1")
    String getTopCategory();

    @Query("SELECT SUM(e.amount) FROM Expense e WHERE e.category = :category")
    Double getExpenseByCategory(@Param("category") String category);

    @Query("SELECT SUM(e.amount) FROM Expense e WHERE MONTH(e.date) = :month")
    Double getExpenseByMonth(@Param("month") int month);

}
