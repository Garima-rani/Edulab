package com.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.connection.getConn;

/**
 * Servlet implementation class deleteStudent
 */
@WebServlet("/updateStudent")
public class updateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		response.setContentType("text/html");
		
String id = request.getParameter("id");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String contact_no=request.getParameter("contact_no");
String gender=request.getParameter("gender");
String pass=request.getParameter("pass");
String address=request.getParameter("address");
PrintWriter out=response.getWriter();
	int i=0;	
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","root");
			String up="update student set fname=?,lname=?,email=?,contact_no=?,gender=?,password=?,address=? where id=?";
			PreparedStatement ps=con.prepareStatement(up);
        	ps.setString(1, fname);
        	ps.setString(2, lname);
			ps.setString(3, email);
			ps.setString(4, contact_no);
			ps.setString(5, gender);
			ps.setString(6, pass);
			ps.setString(7, address);
			ps.setString(8, id);
			i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("students.jsp");
			}
		
		}
		catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
			System.out.println("error");
		}
		
		
	}
	}
