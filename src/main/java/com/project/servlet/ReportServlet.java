package com.project.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.project.db.DBConnection;

@WebServlet("/report")
@MultipartConfig
public class ReportServlet extends HttpServlet {
	
	 private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String location = request.getParameter("location");
        String description = request.getParameter("description");

        // 🔥 File handling
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        // ✅ Upload path inside project
        String uploadPath = getServletContext().getRealPath("") + "uploads/";

        // Create folder if not exists
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Save file
        filePart.write(uploadPath + fileName);

        // Session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO complaints(user_id, location, description, image_path, status) VALUES (?, ?, ?, ?, 'Pending')"
            );

            ps.setInt(1, userId);
            ps.setString(2, location);
            ps.setString(3, description);
            ps.setString(4, fileName);

            ps.executeUpdate();

            response.sendRedirect("userDashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}