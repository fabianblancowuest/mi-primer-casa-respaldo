const panelNumeros = document.getElementById("panel-numeros");

window.addEventListener("scroll", function () {
	const chevron = document.getElementById("chevron");

	// Verifica si hay scroll disponible
	if (document.body.scrollHeight > window.innerHeight) {
		chevron.style.display = "block"; // Muestra el chevron
	} else {
		chevron.style.display = "none"; // Oculta el chevron
	}

	// Verifica si el usuario ha llegado al final de la p�gina
	if (window.innerHeight + window.scrollY >= document.body.scrollHeight) {
		chevron.style.display = "none"; // Oculta el chevron
	}
});

// Agrega un evento para hacer scroll al hacer clic en el chevron
document.getElementById("chevron").addEventListener("click", function () {
	const scrollAmount = 300; // Ajusta este valor para el tama�o del desplazamiento
	const nextScrollY = window.scrollY + scrollAmount; // La posici�n siguiente
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
