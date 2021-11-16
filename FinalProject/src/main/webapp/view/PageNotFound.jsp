<%@ page isErrorPage="true" import="java.io.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />

<title>Sample Page</title>

</head>
<body>
<!--content-->
 <div class="container">
        <div class="row">
            <article class="span6 error">
                <img src="img/error.png" alt="">
            </article>
            <article class="span6">
                <div class="row">
                    <div class="span6">
                        <h5>Sorry!</h5>
                        <h6>page not found</h6>
                        <div class="row">
                            <article class="span4">
                                <p class="margBot1">The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</p>
                                <p class="margBot1">Please try using our search box below to look for information on the website</p>

                            </article>
                        </div>
                    </div>
                </div>
            </article>
        </div>

        Message:
        <div><%=exception.getMessage() %></div>
        StackTrace:
        <div><%
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        exception.printStackTrace(printWriter);
        out.println(stringWriter);
        printWriter.close();
        stringWriter.close();
        %></div>

 </div>


</body>
</html>