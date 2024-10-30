document.addEventListener("DOMContentLoaded", function () {
	const btnConfirmarOperacion = document.getElementById(
		"obutConfirmaOperacion",
	);
	const msjCompradorAlVendedor = document.getElementById(
		"olblMensajeCompradorAlVendedor",
	);

	const panelNumeros = document.getElementById("panel-numeros");
	const panelPremios = document.getElementById("panel-premios");

	const msjWhatsapp = document.getElementById("msj-whatsapp");
	const nroCelular = document.getElementById("contenedor-nro-celular");
	const transaccionCliente = document.getElementById("transaccion-cliente");
	const btnWhatsapp = document.getElementById("btn-whatsapp");
	const btnCloseModalEncuesta = document.getElementById("closeModalBtn");
	const panelEncuesta = document.getElementById("contenido-encuesta");
	const celularNoInformado = document.getElementById("celular-no-informado");
	const sessionUsuarioVendedor = document
		.getElementById("olblSession")
		.textContent.trim();
	const nombreVendedor = document.getElementById(
		"olblVendedorReferenciaNombre",
	);
	const celularVendedor = document.getElementById(
		"olblVendedorReferenciaCelular",
	);
	const celularVendedorSpan = document.getElementById("vendedor-celular");
	const nombreVendedorSpan = document.getElementById("vendedor-nombre");

	const textoValidadorCelular = document.getElementById(
		"texto-validador-celular",
	);

	const btnWhatsAppSession = document.getElementById("btn-whatsapp-session");

	const inputNombre = document.getElementById("otxtClienteApyNom");

	const panelConfirmacion = document.getElementById("PanelConfirmaOperacion");

	//Actualiza el vendedor din�micamente
	if (nombreVendedorSpan) {
		nombreVendedorSpan.innerText = nombreVendedor.textContent;
	}
	if (celularVendedorSpan) {
		celularVendedorSpan.innerText = celularVendedor.textContent;
	}

	const celNoValidado = document.getElementById(
		"olblCelularNumeroValidadoMensaje",
	);
	const msjInicial = document.getElementById("msj-inicial");
	const msjInicialValidado = document.getElementById("msj-inicial-validado");
	const validarCelular = document.getElementById("olblCelularNumeroMensaje");

	let estaValidado = false;

	if (!inputNombre.value) {
		msjInicial.style.display = "flex";
		msjInicialValidado.style.display = "none";

		textoValidadorCelular.textContent = "Celular No Validado❌";
		btnWhatsAppSession.addEventListener("click", function () {
			const encodedMessage = encodeURIComponent(sessionUsuarioVendedor);
			const url = `https://wa.me/543704779106?text=${encodedMessage}`;
			window.open(url, "_blank");
		});
	} else {
		msjInicial.style.display = "none";
		msjInicialValidado.style.display = "flex";

		estaValidado = true;
		textoValidadorCelular.textContent = "Celular Validado✅️";
		textoValidadorCelular.style.color = "green";
	}

	console.log(msjInicial);
	console.log(sessionUsuarioVendedor);

	if (panelConfirmacion) {
		const enlaceWhatsappVendedor = document.getElementById(
			"enlace-whatsapp-vendedor",
		);

		let whatsAppVendedor = celularVendedor.textContent.trim();

		// Mensaje comprador al vendedor
		encodedMessage = encodeURIComponent(
			msjCompradorAlVendedor.innerText.trim(),
		);

		// encodedMessage = encodedMessage.replace(/\./g, '.%0A');

		enlaceWhatsappVendedor.href = `https://wa.me/${whatsAppVendedor}?text=${encodedMessage}`;

		if (btnConfirmarOperacion) {
			btnConfirmarOperacion.addEventListener("click", () => {
				window.open(enlaceWhatsappVendedor, "_blank");
			});
		}
	}

	window.addEventListener("scroll", function () {
		const chevron = document.getElementById("chevron");
		const hasScroll = document.body.scrollHeight > window.innerHeight;

		// Calcular si se debe mostrar el chevron
		const isAtBottom =
			window.innerHeight + window.scrollY >= document.body.scrollHeight;

		// Mostrar u ocultar chevron
		chevron.style.display = hasScroll && !isAtBottom ? "block" : "none";
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

	// La funci�n para hacer scroll a la secci�n espec�fica
	function scrollToSection(sectionId) {
		const section = document.getElementById(sectionId);
		if (section) {
			section.scrollIntoView({ behavior: "smooth" });
		}
	}

	// Asignamos eventos de clic a los botones
	if (btnNumeros) {
		btnNumeros.addEventListener("click", function (event) {
			event.preventDefault();
			scrollToSection("panel-numeros");
		});
	}

	if (btnPremios) {
		btnPremios.addEventListener("click", function (event) {
			event.preventDefault();
			scrollToSection("panel-premios");
		});
	}

	// console.log(btnPremios);

	if (linkEncuesta) {
		linkEncuesta.addEventListener("click", function (event) {
			event.preventDefault();
			scrollToSection("contenido-encuesta");
		});
	}

	if (btnCloseModalEncuesta) {
		btnCloseModalEncuesta.addEventListener("click", function (event) {
			event.preventDefault();
			scrollToSection("contenido-encuesta");
		});
	}

	// Botones vuelve a seleccionar Método de Pago
	const btnVuelveSelecMetodoPago = {
		efectivo: document.getElementById(
			"obutVuelveSeleccionFormaPagoDesdeEfectivo",
		),
		mercadoPago: document.getElementById("obutVuelveSeleccionFormaPagoDesdeMP"),
		tranferencia: document.getElementById(
			"obutVuelveSeleccionFormaPagoDesdeTransferencia",
		),
	};

	if (linkEncuesta) {
		linkEncuesta.addEventListener("click", (event) => {
			event.preventDefault();
			panelPremios.scrollIntoView({ behavior: "smooth" });
		});
	}

	// Funci�n para copiar texto al portapapeles
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
			alert("No se encontr� el texto para copiar.");
		}
	}

	// Eventos para botones de copiar
	const btnCopiarCvu = document.getElementById("btn-copiar-cvu");
	if (btnCopiarCvu) {
		btnCopiarCvu.addEventListener("click", function (event) {
			copyToClipboard(event, "otxtDatosBancoParaTransferencia02", "CVU");
		});
	}

	const btnCopiarAlias = document.getElementById("btn-copiar-alias");
	if (btnCopiarAlias) {
		btnCopiarAlias.addEventListener("click", function (event) {
			copyToClipboard(event, "otxtDatosBancoParaTransferencia03", "ALIAS");
		});
	}
});
