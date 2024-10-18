document.addEventListener("DOMContentLoaded", () => {
	const panelNumeros = document.getElementById("panel-numeros");
	const panelPremios = document.getElementById("panel-premios");
	const validarCelular = document.getElementById("olblCelularNumeroMensaje");
	const celNoValidado = document.getElementById(
		"olblCelularNumeroValidadoMensaje",
	);
	const msjInicial = document.getElementById("msj-inicial");
	const msjWhatsapp = document.getElementById("msj-whatsapp");

	// Mensaje inicial según el estado del celular
	msjInicial.textContent =
		validarCelular.textContent === "Celular validado"
			? "Seleccione los números y participe de los sorteos mayores y también de los sorteos semanales."
			: "Complete sus datos para que podamos enviarle sus comprobantes a su correo electrónico y Whatsapp.";

	// Mostrar/ocultar mensaje de WhatsApp según el estado de validación
	msjWhatsapp.style.display =
		celNoValidado.textContent === "Número de celular no validado"
			? "flex"
			: "none";

	// Mostrar/ocultar mensaje de validación de celular
	validarCelular.style.display =
		validarCelular.textContent === "Celular validado" ? "block" : "none";

	window.addEventListener("scroll", function () {
		const chevron = document.getElementById("chevron");
		const hasScroll = document.body.scrollHeight > window.innerHeight;

		// Mostrar u ocultar chevron
		chevron.style.display =
			hasScroll &&
			window.innerHeight + window.scrollY < document.body.scrollHeight
				? "block"
				: "none";
	});

	// Scroll suave al hacer clic en el chevron
	document.getElementById("chevron").addEventListener("click", function () {
		const scrollAmount = 300;
		const nextScrollY = window.scrollY + scrollAmount;
		const maxScrollY = document.body.scrollHeight - window.innerHeight;

		window.scrollTo({
			top: Math.min(nextScrollY, maxScrollY),
			behavior: "smooth",
		});
	});

	// Función para hacer scroll a una sección específica
	function scrollToSection(sectionId) {
		document.getElementById(sectionId).scrollIntoView({ behavior: "smooth" });
	}

	const btnNumeros = document.getElementById("obutNumeros");
	btnNumeros.addEventListener("click", (event) => {
		event.preventDefault();
		panelNumeros.scrollIntoView({ behavior: "smooth" });
	});
	const btnPremios = document.getElementById("obutPremios");
	btnPremios.addEventListener("click", (event) => {
		event.preventDefault();
		panelPremios.scrollIntoView({ behavior: "smooth" });
	});

	// Función para copiar texto al portapapeles
	function copyToClipboard(event, textboxId, prefix) {
		event.preventDefault();
		const textBox = document.getElementById(textboxId);
		const text = textBox.innerText;
		let textToCopy = text.split(prefix + " : ")[1];

		if (textToCopy) {
			const tempInput = document.createElement("input");
			tempInput.style.position = "absolute";
			tempInput.style.left = "-1000px";
			tempInput.style.top = "-1000px";
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

	// Eventos para botones de copiar
	document
		.getElementById("btn-copiar-cvu")
		.addEventListener("click", (event) => {
			copyToClipboard(event, "otxtDatosBancoParaTransferencia02", "CVU");
		});

	document
		.getElementById("btn-copiar-alias")
		.addEventListener("click", (event) => {
			copyToClipboard(event, "otxtDatosBancoParaTransferencia03", "ALIAS");
		});
});
