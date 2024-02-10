<%@page import="model.Fournisseur"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>

<% Fournisseur fourniss = (Fournisseur) request.getAttribute("fournisseur");
    request.removeAttribute("fournisseur");%>

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
                            <a href="FournisseurController?action=getlist" class="btn btn-info">Retour</a>
                            <h4 class="card-title text-primary">Modification Fournisseur</h4>
                        </div>
                        <div class="card-body">
                            <form id="loginForm" method="POST" action="FournisseurController">
                                <input type="hidden" value="modifier" name="action">
                                <input type="hidden" value="<%=fourniss.getIdFournisseur() %>" name="idFournisseur">
                                <div class="mb-3">
                                    <label for="nom" class="form-label">Nom du Fournisseur</label>
                                    <input type="text" class="form-control" name="nomFournisseur" required value="<%= (fourniss != null) ? fourniss.getNomFournisseur() : ""%>">
                                </div>
                                <div class="mb-3">
                                    <label for="nom" class="form-label">contact</label>
                                    <input type="text" class="form-control"  name="contactFournisseur" required value="<%= (fourniss != null) ? fourniss.getContact() : ""%>" >
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
