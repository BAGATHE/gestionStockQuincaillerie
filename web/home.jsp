<%@page import="model.Fournisseur"%>
<%@page import="model.CategorieArticle"%>
<%@page import="java.util.List"%>
<%  
    List<CategorieArticle> categorieArticle = (List<CategorieArticle>) request.getAttribute("listCategorie");
    List<Fournisseur> fournisseurs = (List<Fournisseur>) request.getAttribute("listFournisseur");


%>
<jsp:include page="head.jsp" />      
<jsp:include page="navigation.jsp" />   
        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
                <a href="index.jsp" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                 <form method="POST" action="SearchController">
                        <div class="row col-12 mb-3">
                            <div class="col-md-2">
                                <label for="prixMin" class="form-label">Prix min</label>
                                <input type="number" class="form-control" name="prixMin">
                            </div>
                            <div class="col-md-2">
                                <label for="prixMax" class="form-label">Prix Max</label>
                                <input type="number" class="form-control" name="prixMax" id="prix">
                            </div>
                            <div class="col-md-2">
                              <label for="Fournisseur" class="form-label">Fournisseur</label>
                                    <select class="form-control" id="fournisseur" name="idFournisseur" >
                                        <option value="">veuillez choisir</option>
                                        <% for (Fournisseur fournisseur : fournisseurs) {%>
                                        <option value="<%=fournisseur.getIdFournisseur() %>"><%= fournisseur.getNomFournisseur() %></option>
                                        <% }%>
                                    </select>
                            </div>
                            <div class="col-md-2">
                                <label for="categorie" class="form-label">categorie</label>
                                    <select class="form-control" id="categorie" name="idCategorie">
                                        <option value="">veuillez choisir</option>
                                        <% for (CategorieArticle categ : categorieArticle) {%>
                                        <option value="<%=categ.getIdCategorie()%>"><%=categ.getNomCategorie()%></option>
                                        <% } %>
                                    </select>
                            </div>
                            <div class="col-md-2">
                                <input type="submit" class="btn btn-primary" value="Recherche" style="margin-top: 4vh">
                            </div>
                           
                        </div>
                 </form>
            </nav>
            <!-- Navbar End -->


            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Today Sale</p>
                                <h6 class="mb-0">$1234</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Sale</p>
                                <h6 class="mb-0">$1234</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Today Revenue</p>
                                <h6 class="mb-0">$1234</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Revenue</p>
                                <h6 class="mb-0">$1234</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sale & Revenue End -->


            <!-- Sales Chart Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-secondary text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Worldwide Sales</h6>
                                <a href="">Show All</a>
                            </div>
                            <canvas id="worldwide-sales"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-secondary text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Salse & Revenue</h6>
                                <a href="">Show All</a>
                            </div>
                            <canvas id="salse-revenue"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sales Chart End -->
           <jsp:include page="foot.jsp" />