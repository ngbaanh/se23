package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.session.PendingDisc;
/**
 * Servlet implementation class BuildTicket
 */
@WebServlet("/BuildTicket")
public class BuildTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuildTicket() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		ArrayList<PendingDisc> list = (ArrayList<PendingDisc>) request.getSession().getAttribute("listPendingDisc");
		if (list == null || list.isEmpty()) {
			response.sendRedirect("ViewDiscSeriesList");
		} else {
			if (request.getParameter("do") != null) {
				// TODO - xu li dat phieu 
				response.getWriter().append("OK DANG XU LI.///");
			} else {
				request.getRequestDispatcher("/WEB-INF/BuildTicket.jsp").include(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
