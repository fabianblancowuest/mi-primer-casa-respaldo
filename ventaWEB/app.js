// JavaScript source code
const btnNumeros = document.getElementById("obutNumeros");
const btnPremios = document.getElementById("obutPremios");
const btnPagar = document.getElementById("obutCobrar");
const nrosSeleccionados = document.getElementById("olblBilletesSeleccionadosCantidad");
const talonesSeleccionados = document.getElementById("olblCantidadTotal");
const btnSeleccionarArchivo = document.getElementById("file-upload-button");
//textareaPanelUpload.disabled = true;


let textareas = document.getElementsByTagName('textarea');

for (let i = 0; i < textareas.length; i++) {
    textareas[i].disabled = true;
}

let ultimoElem = textareas[textareas.length - 1];

const ajustarTamanio = () => {
    
    if (window.innerWidth < 768) {
        ultimoElem.style.height = "140px";
        ultimoElem.style.width = "100%";
    ultimoElem.style.padding = "1em 0";
    }
}


btnNumeros.addEventListener("click", () => {
    if(nrosSeleccionados.textContent === "0") {
        alert("Debe seleccionar un número");
    }
    console.log("hiciste click");

})

//ajustarTamanio();
//window.addEventListener('resize', ajustarTamanio);



