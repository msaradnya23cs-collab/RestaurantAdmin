package com.restaurant;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/BookingServlet")

public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String msg = "";
        try {
            Connection c = DBConnection.getConn();
            PreparedStatement ps = c.prepareStatement(
                "INSERT INTO bookings(customer, tableno, booking_date, booking_time) VALUES(?,?,?,?)"
            );
            ps.setString(1, req.getParameter("customer"));
            ps.setInt(2, Integer.parseInt(req.getParameter("tableno")));
            ps.setDate(3, Date.valueOf(req.getParameter("date")));              // yyyy-MM-dd from form
            ps.setTime(4, Time.valueOf(req.getParameter("time") + ":00"));        // HH:mm:ss
            ps.executeUpdate();

            msg = "Booking Added Successfully";
        } catch(Exception e){
            e.printStackTrace();
            msg = "Operation Failed: " + e.getMessage(); // Shows the exact SQL/connection error
        }

        // Redirect back to booking.jsp with the message
        res.sendRedirect("booking.jsp?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
    }

    // Optional: Delete booking
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String msg = "";
        try {
            Connection c = DBConnection.getConn();
            PreparedStatement ps = c.prepareStatement("DELETE FROM bookings WHERE id=?");
            ps.setInt(1, Integer.parseInt(req.getParameter("id")));
            ps.executeUpdate();
            msg = "Booking Deleted Successfully";
        } catch(Exception e){
            e.printStackTrace();
            msg = "Delete Failed: " + e.getMessage();
        }
        res.sendRedirect("booking.jsp?msg=" + java.net.URLEncoder.encode(msg, "UTF-8"));
    }
}
