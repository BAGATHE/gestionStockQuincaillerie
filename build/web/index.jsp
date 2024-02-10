<jsp:include page="head.jsp" />          
<!-- Sign In Start -->
<div class="container-fluid">
    <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
        <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
            <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <a href="index.jsp" class="">
                        <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>DarkPan</h3>
                    </a>
                    <h3>Connexion</h3>
                </div>
                <form method="POST" action="UserController"> 
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="floatingInput" name="email">
                        <label for="floatingInput">Email address</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input type="password" class="form-control" id="floatingPassword" name="password">
                        <label for="floatingPassword">Password</label>
                    </div>
                    <div class="d-flex align-items-center justify-content-between mb-4">
                    </div>
                    <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Sign In</button>
                </form>
                <!-- affichage de l'erreur -->
                <%
                  //  HttpSession session = request.getSession();
                    String error = (String) session.getAttribute("sessionError");
                    if (error != null && !error.isEmpty()) {
                %>
                <div class="error-message">
                    <%= error%>
                </div>
                <%
                        // Effacer l'erreur de la session apr�s l'avoir affich�e
                        session.removeAttribute("sessionError");
                    }
                %>


                <p class="text-center mb-0">Si vous n'etes pas administrateur <a href="home.jsp">Cliquez ici!</a></p>
            </div>
        </div>
    </div>
</div>
<!-- Sign In End -->
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="asset/js/controller.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="asset/lib/chart/chart.min.js"></script>
<script src="asset/lib/easing/easing.min.js"></script>
<script src="asset/lib/waypoints/waypoints.min.js"></script>
<script src="asset/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="asset/lib/tempusdominus/js/moment.min.js"></script>
<script src="asset/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="asset/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Template Javascript -->
<script src="asset/js/main.js"></script> 
</body>

</html>