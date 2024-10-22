document.addEventListener("DOMContentLoaded", () => {
	const panelNumeros = document.getElementById("panel-numeros");
	const panelPremios = document.getElementById("panel-premios");
	const validarCelular = document.getElementById("olblCelularNumeroMensaje");
	const celNoValidado = document.getElementById(
		"olblCelularNumeroValidadoMensaje",
	);
	const msjInicial = document.getElementById("msj-inicial");
	const msjWhatsapp = document.getElementById("msj-whatsapp");
	const nroCelular = document.getElementById("contenedor-nro-celular");
	const transaccionCliente = document.getElementById("transaccion-cliente");

	// Mensaje inicial según el estado del celular
	//msjInicial.textContent = validarCelular.textContent === "Celular validado" ?
	//    `Elige tus números y participa en los sorteos principales, así como en los sorteos semanales. ¡No te pierdas la oportunidad de ganar!` :
	//    `Complete sus datos para que podamos enviarle sus comprobantes a su correo electrónico y Whatsapp.`;

	const msjInicialValidado = document.getElementById("msj-inicial-validado");
	if (validarCelular.textContent === "Celular validado") {
		msjInicial.style.display = "none";
		msjInicialValidado.style.display = "flex";
	} else {
		msjInicialValidado.style.display = "none";
		msjInicial.style.display = "flex";
	}

	// Mostrar/ocultar mensaje de WhatsApp según el estado de validación
	//msjWhatsapp.style.display = celNoValidado.textContent === "Número de celular no validado" ? "flex" : "none";
	if (celNoValidado.textContent === "Número de celular no validado") {
		msjWhatsapp.style.display = "flex";
	} else if (validarCelular.textContent === "Celular validado") {
		msjWhatsapp.style.display = "none";
		const msjNoValidado = document.createElement("span");
		msjNoValidado.textContent = "Celular Validado";
		msjNoValidado.className = "celular-validado";
		nroCelular.appendChild(msjNoValidado);
	}

	// Mostrar/ocultar mensaje de validación de celular
	//validarCelular.style.display = validarCelular.textContent === "Celular validado" ? "block" : "none";

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
		const scrollAmount = 450;
		const nextScrollY = window.scrollY + scrollAmount;
		const maxScrollY = document.body.scrollHeight - window.innerHeight;

		window.scrollTo({
			top: Math.min(nextScrollY, maxScrollY),
			behavior: "smooth",
		});
	});

	// Seleccionamos los botones por su ID
	const btnNumeros = document.getElementById("obutNumeros");
	const btnPremios = document.getElementById("obutPremios");
	const linkEncuesta = document.getElementById("link-encuesta");

	// La función para hacer scroll a la sección específica
	function scrollToSection(sectionId) {
		const section = document.getElementById(sectionId);
		if (section) {
			section.scrollIntoView({ behavior: "smooth" });
		}
	}

	// Asignamos eventos de clic a los botones
	if (btnNumeros) {
		btnNumeros.addEventListener("click", function (event) {
			event.preventDefault(); // Prevenimos el comportamiento por defecto (si es necesario)
			scrollToSection("panel-numeros"); // Desplazamos hacia la sección 'panel-numeros'
		});
	}

	if (btnPremios) {
		btnPremios.addEventListener("click", function (event) {
			event.preventDefault();
			scrollToSection("panel-premios"); // Desplazamos hacia la sección 'panel-premios'
		});
	}

	if (linkEncuesta) {
		linkEncuesta.addEventListener("click", function (event) {
			event.preventDefault();
			scrollToSection("contenido-encuesta"); // Desplazamos hacia la sección 'encuesta'
		});
	}

	btnNumeros.addEventListener("click", (event) => {
		event.preventDefault();
		panelNumeros.scrollIntoView({ behavior: "smooth" });
	});
	btnPremios.addEventListener("click", (event) => {
		event.preventDefault();
		panelPremios.scrollIntoView({ behavior: "smooth" });
	});

	//linkEncuesta.addEventListener("click", (event) => {
	//    event.preventDefault();
	//panelPremios.scrollIntoView({ behavior: 'smooth' });
	//})

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

	btnPremios.addEventListener("click", () => {
		document.getElementById("prueba").style.display = "block";
	});
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
