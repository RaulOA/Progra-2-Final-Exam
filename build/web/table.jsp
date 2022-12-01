<%@page import="java.sql.*"%>
<!doctype html>
<html lang="en" class="h-100">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Final Exam</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" 
              crossorigin="anonymous">
        <link href="cover.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" 
                crossorigin="anonymous">
        </script>

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }

            .b-example-divider {
                height: 3rem;
                background-color: rgba(0, 0, 0, .1);
                border: solid rgba(0, 0, 0, .15);
                border-width: 1px 0;
                box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            }

            .b-example-vr {
                flex-shrink: 0;
                width: 1.5rem;
                height: 100vh;
            }

            .bi {
                vertical-align: -.125em;
                fill: currentColor;
            }

            .nav-scroller {
                position: relative;
                z-index: 2;
                height: 2.75rem;
                overflow-y: hidden;
            }

            .nav-scroller .nav {
                display: flex;
                flex-wrap: nowrap;
                padding-bottom: 1rem;
                margin-top: -1px;
                overflow-x: auto;
                text-align: center;
                white-space: nowrap;
                -webkit-overflow-scrolling: touch;
            }
        </style>

    </head>
    <body class="d-flex h-100 text-center text-bg-dark">

        <%
            ResultSet resultset = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/final_exam", "root", "ne5ddd90");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from students");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %> 

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header class="mb-auto">
                <div>
                    <h3 class="float-md-start mb-0">Final Exam</h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                    </nav>
                </div>
            </header>

            <main class="px-3">
                <h1>List of Students</h1>
                <form action="save.jsp">
                    <table class="table table-dark">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Note</th>
                            <th scope="col"> - - </th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            if (resultset.next()) {
                                do {%>
                        <tr>
                            <th scope="row"><%=resultset.getString("student_id")%></th>
                            <td><%=resultset.getString("student_name")%> </td>
                            <%if (resultset.getInt("student_note") == 0) {
                            %><td> Empty </td><%
                            } else {%>
                            <td><%=resultset.getInt("student_note")%></td>
                            <%}%>
                            <td><input name="<%=resultset.getString("student_id")%>" placeholder="New Score" class="form-control" type="number" required="required"></td>                            
                            <%if (resultset.getString("student_status") == null) {
                            %><td> Empty </td><%
                            } else {%>
                            <td><%=resultset.getString("student_status")%></td>
                            <%}%>
                        </tr>
                        <%} while (resultset.next());
                            }%>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-lg btn-primary fw-bold">Save</button>
                    
                </form>
                
            </main>

        </div>
    </body>
</html>
