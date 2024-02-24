<%@page import="model.User"%>
<%@page import="model.CategorieArticle"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession" %>  
<% List<CategorieArticle> categorieArticle = (List<CategorieArticle>) request.getAttribute("listCategorie");
    User user = (User) session.getAttribute("sessionUser");

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
                    <button type="button" class="btn btn-lg btn-outline-secondary" id="displayFormBtn" <% if (user == null) { %>disabled<% }%>>
                        INSERER UNE NOUVELLE CATEGORIE
                    </button>
                </div>
            </div>
        </div> 
        <!--fin button-->
        <!--formulaire insertion categorie-->
        <div class="row insert justify-content-center" id="displayForm" style="display: none">
            <div class="col-md-6">
                <div class="card bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                    <div class="card-header">
                        <h4 class="card-title text-primary">Insertion CATEGORIE</h4>
                    </div>
                    <div class="card-body">
                        <form id="loginForm" method="POST" action="CategorieArticleController">
                            <div class="mb-3">
                                <input type="hidden" value="ajouter" name="action">
                                <label for="nom" class="form-label">Nom Categorie</label>
                                <input type="text" class="form-control"  name="nomCategorie" required>
                            </div>
                            <input type="submit" class="btn btn-primary" value="Valider">
                        </form>
                    </div>
                </div>
            </div>
        </div>
       
        <div class="row">
            <h1 class="text-center">Liste Categorie des Article</h1>
        </div>

        <div class="bg-secondary text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
                <h6 class="mb-0">Nombre de Categorie : <%= categorieArticle.size()%></h6>
            </div>
            <div class="table-responsive">
                <table class="table text-start align-middle table-bordered table-hover mb-0">
                    <thead>
                        <tr class="text-white">
                            <th scope="col">identifiant</th>
                            <th scope="col">Designation Categorie</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (CategorieArticle categorie :  categorieArticle) {%>
                        <tr>
                            <td><%= categorie.getIdCategorie() %></td>
                            <td><%= categorie.getNomCategorie() %></td>
                            <td>
                                <% if (user != null) {%>
                                <a href="FormCategorieController?action=modifier&idCategorie=<%= categorie.getIdCategorie() %>" class="btn btn-warning" id="btnModif">Modifier</a>
                                <% } else { %>
                                <span class="btn btn-disabled">Modifier</span>
                                <% } %>
                            </td>
                            <td>
                                <% if (user != null) {%>
                                <a href="CategorieArticleController?action=delete&idCategorie=<%= categorie.getIdCategorie() %>" class="btn btn-primary">Supprimer</a>
                                <% } else { %>
                                <span class="btn btn-disabled">Supprimer</span>
                                <% } %>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Recent Sales End -->
    <jsp:include page="foot.jsp" />