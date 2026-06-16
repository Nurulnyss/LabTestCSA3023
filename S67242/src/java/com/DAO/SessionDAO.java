package com.DAO;

import com.model.SessionBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SessionDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/drivesmart_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
private static final String INSERT_TRAINING_SESSIONS_SQL =
            "INSERT INTO Training_Sessions " +
            "(student_name, branch_location, type, status) " +
            "VALUES (?, ?, ?, ?)";

    private static final String SELECT_TRAINING_SESSIONS_BY_ID =
            "SELECT session_id, student_name, branch_location, type, status " +
            "FROM Training_Sessions WHERE session_id = ?";

    private static final String SELECT_ALL_TRAINING_SESSIONS =
            "SELECT * FROM Training_Sessions";

    public SessionDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(
                    jdbcURL,
                    jdbcUsername,
                    jdbcPassword
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }

    // INSERT
    public void insertSessionBean(SessionBean trainingSession)
            throws SQLException {

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(
                             INSERT_TRAINING_SESSIONS_SQL)) {

            preparedStatement.setString(
                    1,
                    trainingSession.getStudent_name()
            );

            preparedStatement.setString(
                    2,
                    trainingSession.getBranch_location()
            );

            preparedStatement.setString(
                    3,
                    trainingSession.getType()
            );

            preparedStatement.setString(
                    4,
                    trainingSession.getStatus()
            );

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // SELECT BY ID
    public SessionBean selectTrainingSession(int id) {

        SessionBean trainingSession = null;

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(
                             SELECT_TRAINING_SESSIONS_BY_ID)) {

            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {

                int sessionId = rs.getInt("session_id");
                String studentName = rs.getString("student_name");
                String branchLocation = rs.getString("branch_location");
                String type = rs.getString("type");
                String status = rs.getString("status");

                trainingSession =
                        new SessionBean(
                                sessionId,
                                studentName,
                                branchLocation,
                                type,
                                status
                        );
            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return trainingSession;
    }

    // SELECT ALL
    public List<SessionBean> selectAllTrainingSessions() {

        List<SessionBean> sessions = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(
                             SELECT_ALL_TRAINING_SESSIONS)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                int sessionId = rs.getInt("session_id");
                String studentName = rs.getString("student_name");
                String branchLocation = rs.getString("branch_location");
                String type = rs.getString("type");
                String status = rs.getString("status");

                sessions.add(
                        new SessionBean(
                                sessionId,
                                studentName,
                                branchLocation,
                                type,
                                status
                        )
                );
            }

        } catch (SQLException e) {
            printSQLException(e);
        }

        return sessions;
    }

    private void printSQLException(SQLException ex) {
        ex.printStackTrace();
    }

}