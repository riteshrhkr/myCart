
<%
String color = (String) session.getAttribute("messageColor");
if (color == "success") {
%>
<%@include file="messageSuccess.jsp"%>
<%
} else if (color == "warning") {
%>
<%@include file="messageWarning.jsp"%>
<%
} else {
%>
<%@include file="messageDanger.jsp"%>
<%
}
%>