<%@page import="java.lang.Object"%>
<%@page import="model.Fournisseur"%>
<%@page import="model.User"%>
<%@page import="model.CategorieArticle"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession" %>  
<%  List<List<Object>> articles = (List<List<Object>>) request.getAttribute("article");
%>
<jsp:include page="head.jsp" />      
<jsp:include page="navigation.jsp" />   
<!-- Content Start -->
<div class="content"> 
    <!-- Recent Sales Start -->
    <div class="container-fluid pt-4 px-4">

        <!-- buuton pour afficher formulaire gerer avec js-->
        <div class="pt-3 pb-2 mb-3 border-bottom" style="display: flex; justify-content: center">
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="btn-group me-2">
                    <button type="button" class="btn btn-lg btn-outline-secondary" id="displayFormBtn">
                        Retour page principal
                    </button>
                </div>
            </div>
        </div> 
        <!--fin button-->
        <!--formulaire insertion categorie-->
       
        <div class="row">
            <h1 class="text-center">Liste  des Article</h1>
        </div>

        <div class="bg-secondary text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
                <h6 class="mb-0">Nombre d'Articles : <%= articles.size()%></h6>
            </div>
            <div class="table-responsive">
                <table class="table text-start align-middle table-bordered table-hover mb-0">
                    <thead>
                        <tr class="text-white">
                            <th scope="col">identifiant</th>
                            <th scope="col">Designation</th>
                            <th scope="col">prix Fournisseur</th>
                            <th scope="col">prix Vente</th>
                            <th scope="col">Categorie</th>
                            <th scope="col">Fournisseur</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (List<Object> article : articles) {%>
                        <tr>
                            <td><%= article.get(0)%></td>
                            <td><%= article.get(1)%></td>
                            <td><%= article.get(2)%></td>
                            <td><%= article.get(3)%></td>
                            <td><%= article.get(4)%></td>
                            <td><%= article.get(5)%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Recent Sales End -->
    <jsp:include page="foot.jsp" />