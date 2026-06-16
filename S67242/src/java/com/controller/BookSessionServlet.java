package com.controller;

import com.DAO.SessionDAO;
import com.model.SessionBean;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BookSessionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SessionDAO sessionDAO;

    @Override
    public void init() {
        sessionDAO = new SessionDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();

        try {

            switch (action) {

                case "/new":
                    showNewForm(request, response);
                    break;

                case "/insert":
                    insertSession(request, response);
                    break;

                default:
                    listSessions(request, response);
                    break;
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    // =========================
    // SHOW FORM
    // =========================
    private void showNewForm(HttpServletRequest request,
                             HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("session-form.jsp");

        dispatcher.forward(request, response);
    }

    // =========================
    // INSERT SESSION
    // =========================
    private void insertSession(HttpServletRequest request,
                               HttpServletResponse response)
            throws SQLException, IOException {

        String studentName =
                request.getParameter("studentName");

        String branchLocation =
                request.getParameter("branchLocation");

        String type =
                request.getParameter("type");

        String status =
                request.getParameter("status");

        SessionBean session = new SessionBean();

        session.setStudent_name(studentName);
        session.setBranch_location(branchLocation);
        session.setType(type);
        session.setStatus(status);

        sessionDAO.insertSessionBean(session);

        response.sendRedirect("list");
    }

    // =========================
    // DISPLAY ALL SESSIONS
    // =========================
    private void listSessions(HttpServletRequest request,
                              HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        List<SessionBean> listSession =
                sessionDAO.selectAllTrainingSessions();

        request.setAttribute("listSession", listSession);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("schedule.jsp");

        dispatcher.forward(request, response);
    }
}