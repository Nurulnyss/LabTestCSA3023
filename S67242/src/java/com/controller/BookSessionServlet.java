package com.controller;

import com.DAO.SessionDAO;
import com.model.SessionBean;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/list", "/new", "/insert"})
public class BookSessionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SessionDAO sessionDAO;

    @Override
    public void init() {
        sessionDAO = new SessionDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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

                case "/list":
                default:
                    listSessions(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/session-form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertSession(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String studentName = request.getParameter("studentName");
        String branchLocation = request.getParameter("branchLocation");
        String type = request.getParameter("type");
        String status = request.getParameter("status");

        SessionBean session = new SessionBean(studentName, branchLocation, type, status);

        sessionDAO.insertSession(session);

        response.sendRedirect(request.getContextPath() + "/list");
    }

    private void listSessions(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<SessionBean> listSession = sessionDAO.selectAllSessions();

        request.setAttribute("listSession", listSession);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/schedule.jsp");
        dispatcher.forward(request, response);
    }
}