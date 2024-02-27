<%@page import="java.lang.Object"%>
<%@page import="model.Fournisseur"%>
<%@page import="model.User"%>
<%@page import="model.CategorieArticle"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession" %>  
<%  List<List<Object>> articles = (List<List<Object>>) request.getAttribute("article");
    List<CategorieArticle> categorieArticle = (List<CategorieArticle>) request.getAttribute("listCategorie");
    List<Fournisseur> fournisseurs = (List<Fournisseur>) request.getAttribute("listFournisseur");
    
    
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
                        INSERER UNE NOUVELLE ARTICLE
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
                        <h4 class="card-title text-primary">Insertion Article</h4>
                    </div>
                    <div class="card-body">
                        <form id="loginForm" method="POST" action="ArticleController">
                            <div class="mb-3">
                                <input type="hidden" value="ajouter" name="action">
                                <label for="nom" class="form-label">designation</label>
                                <input type="text" class="form-control"  name="designation" required>
                            </div>
                            <div class="mb-3">
                                <label for="prixFournisseur" class="form-label">prix Fournisseur</label>
                                <input type="number" class="form-control"  name="prixFournisseur" required>
                            </div>
                            <div class="mb-3">
                                <label for="prixVente" class="form-label">Prix Vente</label>
                                <input type="number" class="form-control"  name="prixVente" required>
                            </div>
                            <div class="mb-3">
                                <label for="categorie" class="form-label">Categorie Article</label>
                                <select class="form-control" name="idCategorie" required>
                                    <option value="">Veuillez choisir</option>
                                    <% for (CategorieArticle categ : categorieArticle) {%>
                                    <option value="<%= categ.getIdCategorie()%>"><%= categ.getNomCategorie()%></option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="Fournisseur" class="form-label">Fournisseur Article</label>
                                <select class="form-control" id="fournisseur" name="idFournisseur" required>
                                    <option value="">veuillez choisir</option>
                                    <% for (Fournisseur fournisseur : fournisseurs) {%>
                                    <option value="<%=fournisseur.getIdFournisseur()%>"><%=fournisseur.getNomFournisseur()%></option>
                                    <% }%>
                                </select>
                            </div>

                            <input type="submit" class="btn btn-primary" value="Valider">
                        </form>
                    </div>
                </div>
            </div>
        </div>

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
                            <td>
                                <% if (user != null) {%>
                                <a href="FormArticleController?action=modifier&idArticle=<%= article.get(0)%>" class="btn btn-warning" id="btnModif">Modifier</a>
                                <% } else { %>
                                <span class="btn btn-disabled">Modifier</span>
                                <% } %>
                            </td>
                            <td>
                                <% if (user != null) {%>
                                <a href="ArticleController?action=delete&idArticle=<%= article.get(0)%>" class="btn btn-primary">Supprimer</a>
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