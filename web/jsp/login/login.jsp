<%
    String protocol = request.getScheme();
    String serverName = request.getServerName();
    int port = request.getServerPort();
    String project = "mhe";
    String redirectURL = protocol+"://"+serverName+":"+port+"/"+project;
    response.sendRedirect(redirectURL);
%>