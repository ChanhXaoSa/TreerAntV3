<%-- 
    Document   : source_test
    Created on : Feb 23, 2023, 3:08:56 PM
    Author     : tuank
--%>

<%@page import="Treer.dao.PlantDAO"%>
<%@page import="Treer.dto.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-sm-3">
            <%
                ArrayList<Categories> catelist;
                catelist = PlantDAO.printallCategories();

                if (catelist != null && !catelist.isEmpty()) {
                    for (Categories categories : catelist) {
            %> 
            <h5><%= categories.getCateName()%></h4>
                <%
                        }
                    }
                %>
        </div>

    </body>
</html>
