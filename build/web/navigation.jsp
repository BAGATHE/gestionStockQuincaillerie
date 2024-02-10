 <%@page import="model.User"%>
 <%@page import="javax.servlet.http.HttpSession" %>  
<%                  
                    User user = (User) session.getAttribute("sessionUser");                  
                %>
<!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="UserController?action=deconnexion" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><img src="asset/img/logout.svg" style="width: 40px; height: 40px;">Quincaillerie</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle"src="<%= (user!=null) ? "asset/img/admin.png " : "asset/img/customer.png" %>" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0"><%= (user!=null) ? user.getNom() : "Anonyme" %></h6>
                        <span><%= (user!=null) ? user.getStatus(): "Employer" %></span>
                    </div>
                    
                </div>
                <div class="navbar-nav w-100">
                    <a href="home.jsp" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Inventaire</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="FournisseurController?action=getlist" class="dropdown-item">Fournisseurs</a>
                            <a href="categorie.jsp" class="dropdown-item">Categories Article</a>
                            <a href="article.jsp" class="dropdown-item">Article</a>
                            <a href="Commande.jsp" class="dropdown-item">Commandes</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->
