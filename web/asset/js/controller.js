var btnform = document.getElementById("displayFormBtn");

btnform.addEventListener("click", () => {
    // Afficher uniquement l'élément avec l'ID "displayForm"
    var div = document.getElementById("displayForm");
    var divmodif = document.getElementById("displayFormModif");
    div.style.display = 'flex'; 
    divmodif.style.display = 'none';
});
var btnmodif = document.getElementById("btnModif");

btnmodif.addEventListener("click", () => {
    // Afficher uniquement l'élément avec l'ID "displayForm"
    var div = document.getElementById("displayForm");
    var divmodif = document.getElementById("displayFormModif");
    div.style.display = 'none'; 
    divmodif.style.display = 'flex';
});