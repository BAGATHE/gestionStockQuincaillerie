<%@page import="model.User"%>
<%@page import="model.Fournisseur"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
 <%@page import="javax.servlet.http.HttpSession" %>  
<% List<Fournisseur> fournisseurs = (List<Fournisseur>) request.getAttribute("listFournisseur");
 User user = (User) session.getAttribute("sessionUser"); 

%>

<jsp:include page="head.jsp" />      
<jsp:include page="navigation.jsp" />   
<!-- Content Start -->
<div class="content">
    <!-- Navbar Start -->
    <!--
       <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
           <a href="index.jsp.html" class="navbar-brand d-flex d-lg-none me-4">
               <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
           </a>
           <a href="#" class="sidebar-toggler flex-shrink-0">
               <i class="fa fa-bars"></i>
           </a>
           <form class="d-none d-md-flex ms-4">
               <input class="form-control bg-dark border-0" type="search" placeholder="Search">
           </form>
           <div class="navbar-nav align-items-center ms-auto">
               <div>
                   <h4>recherche multi critere min max</h4>
               </div>
           </div>
       </nav>
    <!-- Navbar End -->

    <!-- Recent Sales Start -->
    <div class="container-fluid pt-4 px-4">

        <!-- buuton pour afficher formulaire gerer avec js-->
        <div class="pt-3 pb-2 mb-3 border-bottom" style="display: flex; justify-content: center">
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="btn-group me-2">
                    <button type="button" class="btn btn-lg btn-outline-secondary" id="displayFormBtn" <% if (user == null) { %>disabled<% } %>>
                       INSERER UN NOUVEAU FOURNISSEUR
                    </button>
                </div>
            </div>
        </div> 
        <!--fin button-->
        <!--FORMULAIRE INSERTION-->
        <div class="row insert justify-content-center" id="displayForm" style="display: none">
            <div class="col-md-6">
                <div class="card bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                    <div class="card-header">
                        <h4 class="card-title text-primary">Insertion Fournisseur</h4>
                    </div>
                    <div class="card-body">
                        <form id="loginForm" method="POST" action="FournisseurController">
                            <input type="hidden" value="ajouter" name="action">
                            <div class="mb-3">
                                <label for="nom" class="form-label">Nom du Fournisseur</label>
                                <input type="text" class="form-control" name="nomFournisseur" required>
                            </div>
                            <div class="mb-3">
                                <label for="nom" class="form-label">contact</label>
                                <input type="text" class="form-control"  name="contactFournisseur" required>
                            </div>
                            <input type="submit" class="btn btn-primary" value="Valider">
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <h1 class="text-center">Liste Fournisseur</h1>
        </div>

        <div class="bg-secondary text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
                <h6 class="mb-0">Nombre de Fournisseur : <%=fournisseurs.size()%></h6>
            </div>
            <div class="table-responsive">
                <table class="table text-start align-middle table-bordered table-hover mb-0">
                    <thead>
                        <tr class="text-white">
                            <th scope="col">identifiant</th>
                            <th scope="col">Nom Entreprise du fournisseur</th>
                            <th scope="col">Contact rapide</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Fournisseur fournisseur : fournisseurs) {%>
                        <tr>
                            <td><%= fournisseur.getIdFournisseur()%></td>
                            <td><%=fournisseur.getNomFournisseur()%></td>
                            <td><%=fournisseur.getContact()%></td>
                            <td>
                                <% if (user != null) {%>
                                <a href="FormFournisseurController?action=modifier&idFournisseur=<%= fournisseur.getIdFournisseur()%>" class="btn btn-warning" id="btnModif">Modifier</a>
                                <% } else { %>
                                <span class="btn btn-disabled">Modifier</span>
                                <% } %>
                            </td>
                            <td>
                                <% if (user != null) {%>
                                <a href="FournisseurController?action=delete&idFournisseur=<%= fournisseur.getIdFournisseur()%>" class="btn btn-primary">Supprimer</a>
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