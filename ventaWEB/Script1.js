const panelNumeros = document.getElementById("panel-numeros");

window.addEventListener("scroll", function () {
	const chevron = document.getElementById("chevron");

	// Verifica si hay scroll disponible
	if (document.body.scrollHeight > window.innerHeight) {
		chevron.style.display = "block"; // Muestra el chevron
	} else {
		chevron.style.display = "none"; // Oculta el chevron
	}

	// Verifica si el usuario ha llegado al final de la página
	if (window.innerHeight + window.scrollY >= document.body.scrollHeight) {
		chevron.style.display = "none"; // Oculta el chevron
	}
});

// Agrega un evento para hacer scroll al hacer clic en el chevron
document.getElementById("chevron").addEventListener("click", function () {
	const scrollAmount = 300; // Ajusta este valor para el tamaño del desplazamiento
	const nextScrollY = window.scrollY + scrollAmount; // La posición siguiente
	const maxScrollY = document.body.scrollHeight - window.innerHeight; // Altura total menos altura de la ventana

	// Desplazar solo si no se ha llegado al final
	if (nextScrollY < maxScrollY) {
		window.scrollTo({ top: nextScrollY, behavior: "smooth" });
	} else {
		// Si se ha alcanzado o sobrepasado el final, desplazar al final
		window.scrollTo({ top: maxScrollY, behavior: "smooth" });
	}
});

function scrollToSection(sectionId) {
	document.getElementById(sectionId).scrollIntoView({ behavior: "smooth" });
}
// Deshabilitar todos los textareas

let textareas = document.getElementsByTagName("textarea");

for (let i = 0; i < textareas.length; i++) {
	textareas[i].disabled = true;
}

let panelTransferencia = document.getElementById("PanelTransferencia");
const inputsTransferencia = panelTransferencia.querySelectorAll("input");

console.log(inputsTransferencia);
console.log("Hola mundo");

for (let i = 0; i < inputsTransferencia.length; i++) {
	inputsTransferencia[i].disabled = true;
}

function copyToClipboard(textboxId, prefix) {
	const textBox = document.getElementById(textboxId);
	const text = textBox.value;

	// Extraer el texto después del prefijo y el espacio
	let textToCopy = text.split(prefix + " : ")[1];

	if (textToCopy) {
		// Crear un campo temporal para copiar el texto
		const tempInput = document.createElement("input");
		tempInput.style = "position: absolute; left: -1000px; top: -1000px";
		tempInput.value = textToCopy;
		document.body.appendChild(tempInput);
		tempInput.select();
		document.execCommand("copy");
		document.body.removeChild(tempInput);

		alert(prefix + " copiado: " + textToCopy);
	} else {
		alert("No se encontró el texto para copiar.");
	}
}

document.addEventListener("DOMContentLoaded", () => {
	const modal = document.getElementById("myModal");
	const openModalBtn = document.getElementById("openModalBtn");
	const closeModalBtn = document.getElementById("closeModalBtn");

	// Asegura de que el modal esté oculto al cargar la página
	modal.style.display = "none";

	// Abre el modal cuando se hace clic en el botón
	openModalBtn.addEventListener("click", (event) => {
		event.preventDefault(); // Previene que el botón recargue la página
		modal.style.display = "flex";
		document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
	});

	// Cierra el modal cuando se hace clic en el botón de cerrar
	closeModalBtn.addEventListener("click", () => {
		modal.style.display = "none";
		document.body.classList.remove("no-scroll"); // Restablece el scroll del fondo
	});

	// Cierra el modal cuando se hace clic fuera del contenido del modal
	window.addEventListener("click", (event) => {
		if (event.target === modal) {
			modal.style.display = "none";
			document.body.classList.remove("no-scroll"); // Restablece el scroll del fondo
		}
	});
});

const btnConfirOp = document.getElementById("obutConfirmaOperacion");
btnConfirOp.addEventListener("click", () => {});
