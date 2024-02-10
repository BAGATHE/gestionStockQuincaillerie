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
                <div class="row">
                    <h1 class="text-center">Liste Fournisseur</h1>
                </div>
                
                <!-- buuton pour afficher formulaire gerer avec js-->
                    <div class="pt-3 pb-2 mb-3 border-bottom" style="display: flex; justify-content: center">
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <div class="btn-group me-2">
                                <button type="button" class="btn btn-lg btn-outline-secondary" id="displayFormBtn">INSERER UN NOUVEAU FOURNISSEUR</button>
                            </div>
                        </div>
                    </div> 
                <!--fin button-->
               
                 <div class="row insert justify-content-center" id="displayForm" style="display: none">
                        <div class="col-md-6">
                            <div class="card bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                                <div class="card-header">
                                    <h4 class="card-title text-primary">Insertion Fournisseur</h4>
                                </div>
                                <div class="card-body">
                                    <form id="loginForm" method="POST" action="InsertionController">
                                        <div class="mb-3">
                                            <label for="nom" class="form-label">Materiaux</label>
                                            <input type="text" class="form-control"  name="materiaux" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="prix" class="form-label">prix </label>
                                            <input type="number" class="form-control"  name="prixm" required>
                                        </div>
                                        <input type="submit" class="btn btn-primary" value="Valider">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                
                
                
                
                
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Recent Salse</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                    <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Invoice</th>
                                    <th scope="col">Customer</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Recent Sales End -->
        <jsp:include page="foot.jsp" />