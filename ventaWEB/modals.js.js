document.addEventListener("DOMContentLoaded", () => {
	const validarCelular = document.getElementById("olblCelularNumeroMensaje");
	const msjInicial = document.getElementById("msj-inicial");

	if (validarCelular.textContent === "Celular validado") {
		msjInicial.textContent =
			"Usted está participando por los sorteos de Diciembre";
	} else {
		msjInicial.textContent =
			"Complete sus datos para que podamos enviarle sus comprobantes a su correo electrónico y Whatsapp.";
	}

	const btnRealizarPago = document.getElementById("obutRealizarPago");

	const modal = document.getElementById("myModal");
	const openModalBtn = document.getElementById("openModalBtn");
	const btnConfirmarOperacion = document.getElementById(
		"obutConfirmaOperacion",
	);

	const closeModalBtn = document.getElementById("closeModalBtn");

	// Asegura de que el modal esté oculto al cargar la página
	modal.style.display = "none";

	// Abre el modal cuando se hace clic en el botón
	openModalBtn.addEventListener("click", (event) => {
		console.log(event);
		// Previene que el botón recargue la página
		event.preventDefault();
		modal.style.display = "flex";
		document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
	});

	// Cierra el modal cuando se hace clic en el botón de cerrar
	closeModalBtn.addEventListener("click", () => {
		modal.style.display = "none";
		console.log("Cerrando");
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
