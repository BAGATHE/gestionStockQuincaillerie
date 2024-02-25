<%@page import="model.Article"%>
<%@page import="java.lang.Object"%>
<%@page import="model.Fournisseur"%>
<%@page import="model.User"%>
<%@page import="model.CategorieArticle"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession" %>  
<%  Article article = (Article) request.getAttribute("article");
    List<CategorieArticle> categorieArticle = (List<CategorieArticle>) request.getAttribute("listCategorie");
    List<Fournisseur> fournisseurs = (List<Fournisseur>) request.getAttribute("listFournisseur");


%>

<jsp:include page="head.jsp" />      
<jsp:include page="navigation.jsp" />   
<!-- Content Start -->
<div class="content">

    <!-- Blank Start -->
    <div class="container-fluid pt-4 px-4">
        <div class="row vh-100 bg-secondary rounded align-items-center justify-content-center mx-0">
            <!--FORMULAIRE MODIFICATION-->
            <div class="row insert justify-content-center" id="displayFormModif">
                <div class="col-md-6">
                    <div class="card bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="card-header">
                            <a href="ArticleController?action=getlist" class="btn btn-info">Retour</a>
                            <h4 class="card-title text-primary">Modification Article</h4>
                        </div>
                        <div class="card-body">
                            <form id="loginForm" method="POST" action="ArticleController">
                                <input type="hidden" value="modifier" name="action">
                                <input type="hidden" value="<%= article.getIdArticle()%>" name="idArticle">

                                <div class="mb-3">
                                    <label for="nom" class="form-label">designation</label>
                                    <input type="text" class="form-control"  name="designation" required  value="<%= (article != null) ? article.getDesignation() : ""%>">
                                </div>
                                <div class="mb-3">
                                    <label for="prixFournisseur" class="form-label">prix Fournisseur</label>
                                    <input type="number" class="form-control"  name="prixFournisseur" required  value="<%= (article != null) ? article.getPrixFournisseur() : ""%>">
                                </div>
                                <div class="mb-3">
                                    <label for="prixVente" class="form-label">Prix Vente</label>
                                    <input type="number" class="form-control"  name="prixVente" required  value="<%= (article != null) ? article.getPrixVente() : ""%>">
                                </div>
                                <div class="mb-3">
                                    <label for="categorie" class="form-label">categorie Article</label>
                                    <select class="form-control" id="categorie" name="idCategorie" required>
                                        <option value="">veuillez choisir</option>
                                        <% for (CategorieArticle categ : categorieArticle) {%>
                                        <% if (categ.getIdCategorie().equals(article.getIdCategorie())) {%>
                                        <option value="<%=categ.getIdCategorie()%>" selected><%=categ.getNomCategorie()%></option>
                                        <% } else {%>
                                        <option value="<%=categ.getIdCategorie()%>"><%=categ.getNomCategorie()%></option>
                                        <% } %>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="Fournisseur" class="form-label">Fournisseur Article</label>
                                    <select class="form-control" id="fournisseur" name="idFournisseur" required>
                                        <option value="">veuillez choisir</option>
                                        <% for (Fournisseur fournisseur : fournisseurs) {%>
                                        <% if (fournisseur.getIdFournisseur().equals(article.getIdFournisseur())) {%>
                                        <option value="<%=fournisseur.getIdFournisseur() %>" selected><%= fournisseur.getNomFournisseur() %></option>
                                        <% } else {%>
                                        <option value="<%=fournisseur.getIdFournisseur() %>"><%= fournisseur.getNomFournisseur() %></option>
                                        <% } %>
                                        <% }%>
                                    </select>
                                </div>
                                <div class="mb-3 justify-content-between" > 
                                    <input type="submit" class="btn btn-primary" value="Valider">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Blank End -->


    <jsp:include page="foot.jsp" />
