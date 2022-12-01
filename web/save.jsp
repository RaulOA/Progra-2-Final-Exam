<%@page import="Main.Logic"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Logic x = new Logic();
                x.record_note("205120658", Integer.parseInt(request.getParameter("205120658")));
                x.record_note("602480689", Integer.parseInt(request.getParameter("602480689")));
                x.record_note("401350689", Integer.parseInt(request.getParameter("401350689")));
                x.record_note("304790581", Integer.parseInt(request.getParameter("304790581")));
                x.record_note("406590325", Integer.parseInt(request.getParameter("406590325")));
                x.record_note("205460128", Integer.parseInt(request.getParameter("205460128")));
                x.record_note("405690124", Integer.parseInt(request.getParameter("405690124")));
                x.record_note("702580147", Integer.parseInt(request.getParameter("702580147")));
                x.record_note("602340867", Integer.parseInt(request.getParameter("602340867")));
                x.record_note("502350764", Integer.parseInt(request.getParameter("502350764")));

                out.println("<script type='text/javascript'>alert('Updated Scores Successfully');</script>");
                RequestDispatcher rd = request.getRequestDispatcher("/table.jsp");
                rd.include(request, response);
                
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
    </body>
</html>
