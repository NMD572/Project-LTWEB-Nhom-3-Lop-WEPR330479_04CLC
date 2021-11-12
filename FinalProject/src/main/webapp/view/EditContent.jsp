<%@ page import="model.Content" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Content form</title>
</head>
<body>
<div class = "container">
    <div class = "form-title"> <h1>Edit Content</h1> </div>
    <form action="AddContentController" method="post">

        <div class = "content-form-elements">
            <div class = "content-form-elements-title">
                Content Form Elements
            </div>
        </div>
            <div class ="title">
                <b> <label>Title</label> </b>
                <input type="text" class="form-control"
                       name="title" required="required" value="<c:out value='${contentEdit.getTitle()}' />">
         </div>
        <div class = "brief">
            <b> <label>Content</label> </b>
            <textarea type="text"  class="form-control"
                      name="brief" required="required" style="atext-align:left ; overflow:auto;"><c:out value='${contentEdit.getBrief()}' /></textarea>
        </div>

        <div class = "content">
            <b> <label>Brief</label> </b>
            <textarea type="text"  class="form-control"
                      name="content" required="required"><c:out value='${contentEdit.getContent()}' /></textarea>
        </div>

        <div class = "btn">
            <button type="submit" class="btn btn-success">Submit Button</button>
            <button type="submit" class="btn btn-success">Reset Button</button>
        </div>
    </form>
<%--    <table >--%>
<%--        <tr>--%>
<%--            <td>Title :</td>--%>
<%--            &lt;%&ndash; Below is the JSP expression used to display string value of an expression &ndash;%&gt;--%>
<%--            <td><%=cont.getTitle()%></td>--%>
<%--        </tr>--%>

<%--        <tr>--%>
<%--            <td>Brief :</td>--%>
<%--            <td><%=cont.getBrief()%></td>--%>
<%--        </tr>--%>

<%--        <tr>--%>
<%--            <td>Content :</td>--%>
<%--            <td><%=cont.getContent()%></td>--%>
<%--        </tr>--%>
<%--    </table>--%>


</div>
</body>
</html>


<style>
    .form-title
    {
        font-family: Arial, Helvetica, sans-serif;
        border-bottom: 1px solid lightgrey;
        /* border: 1px solid lightgrey; */
        width: 1400px;
        height: 50px;
        justify-content: center;
    }
    .container form .title
    {
        width:1100px;
        height: 90px;
        margin-top:10px;
        margin-left: 20px;
        /*border: 1px solid black;*/
        display: flex;
        flex-direction: column;
        font-family: Arial, Helvetica, sans-serif;

    }
    .container form .title input
    {
        margin-top: 5px;
        height: 40px;
        padding: 10px;
    }
    .container form .brief
    {
        width:1100px;
        margin-left:20px;
        /*border: 1px solid red;*/
        display: flex;
        flex-direction: column;
        font-family: Arial, Helvetica, sans-serif;
    }
    .container form .brief textarea
    {
        height: 100px;
        margin-top: 5px;
        padding: 10px;
        font-family: Arial, Helvetica, sans-serif;
    }
    .container form .content
    {
        width:1100px;
        margin-left:20px;
        /* border: 1px solid green;  */
        display: flex;
        flex-direction: column;
        font-family: Arial, Helvetica, sans-serif;
    }
    .container form .content textarea
    {
        height: 220px;
        margin-top: 5px;
        margin-bottom:15px;
        padding: 10px;
        font-family: Arial, Helvetica, sans-serif;
    }
    .container form .form-control
    {
        margin-bottom: 20px;
    }
    .container
    {
        margin-top: 5px;
        /* background: #71b7e6; */
        border: 2px black;
    }
    .container form
    {
        margin-top: 20px;
        margin-bottom: 20px;
        /* height:600px; */
        border: 1px solid grey;
        border-radius: 2px;
        width: 1400px;
    }
    .container form .content-form-elements
    {
        font-family: Arial, Helvetica, sans-serif;
        padding: 10px;
        width: 1398px;
        background: rgb(240, 240, 240);
        /* border: 1px solid black; 		 */
    }
    .container form .content-form-elements .content-form-elements-title
    {
        margin-left: 10px;
    }
    .container form .btn
    {
        margin-left: 10px;
        margin-bottom: 15px;
        font-size: 15px;
        font-family: Arial, Helvetica, sans-serif;
        height: 30px;

        width: 250px;
        justify-content: center;
        display: flex;
    }
    .container form .btn button
    {
        line-height: 30px;
    }
</style>
