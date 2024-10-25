document.addEventListener("DOMContentLoaded", () => {
	const modalPremios = document.getElementById("premiosPrincipales");
	const botonPremios = document.getElementById("obutPremios");
	const closePremios = document.getElementById("closeModalPremios");
	const closeBases = document.getElementById("closeBases");
	const btnBases = document.getElementById("btnBases");

	// Modal Bases y Condiciones
	const modalBases = document.getElementById("basesYCondiciones");
	modalBases.style.display = "none"; // Ocultar inicialmente

	// Verifica si el modal de Bases y Condiciones ya fue mostrado en esta sesión
	const modalBasesShown = sessionStorage.getItem("modalBasesShown");

	if (!modalBasesShown) {
		// Mostrar el modal de Bases y Condiciones solo la primera vez en la sesión
		setTimeout(() => {
			modalBases.style.display = "flex";
			document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
		}, 1000);

		// Marcar que ya fue mostrado para no volver a mostrarlo
		sessionStorage.setItem("modalBasesShown", "true");
	}

	// Mostrar el modal de Bases y Condiciones al hacer clic en el botón
	btnBases.addEventListener("click", () => {
		modalBases.style.display = "flex";
		document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
	});

	// Cerrar el modal de Bases y Condiciones
	closeBases.addEventListener("click", () => {
		modalBases.style.display = "none";
		console.log("Cerrando");
		document.body.classList.remove("no-scroll"); // Restablece el scroll del fondo
	});

	modalPremios.style.display = "none"; // Ocultar el modal de premios inicialmente

	botonPremios.addEventListener("click", (event) => {
		event.preventDefault();
		modalPremios.style.display = "flex";
		document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
	});

	closePremios.addEventListener("click", () => {
		modalPremios.style.display = "none";
		console.log("Cerrando");
		document.body.classList.remove("no-scroll"); // Restablece el scroll del fondo
	});

	const btnRealizarPago = document.getElementById("obutRealizarPago");
	const modal = document.getElementById("myModal");
	const openModalBtn = document.getElementById("openModalBtn");
	const btnConfirmarOperacion = document.getElementById(
		"obutConfirmaOperacion",
	);
	const closeModalBtn = document.getElementById("closeModalBtn");

	modal.style.display = "none"; // Ocultar el modal inicialmente

	openModalBtn.addEventListener("click", (event) => {
		console.log(event);
		event.preventDefault();
		modal.style.display = "flex";
		document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
	});

	// Cerrar el modal principal
	closeModalBtn.addEventListener("click", () => {
		modal.style.display = "none";
		console.log("Cerrando");
		document.body.classList.remove("no-scroll"); // Restablece el scroll del fondo
	});

	// Cierra los modales cuando se hace clic fuera del contenido del modal
	window.addEventListener("click", (event) => {
		if (event.target === modal) {
			modal.style.display = "none";
			document.body.classList.remove("no-scroll"); // Restablece el scroll del fondo
		}

		if (event.target === modalPremios) {
			modalPremios.style.display = "none";
			console.log("Cerrando modal de premios");
			document.body.classList.remove("no-scroll"); // Restablece el scroll del fondo
		}

		if (event.target === modalBases) {
			modalBases.style.display = "none";
			console.log("Cerrando modal de bases y condiciones");
			document.body.classList.remove("no-scroll"); // Restablece el scroll del fondo
		}
	});
	//Simula un clic automático en el botón openModalBtn una vez al cargar la página
	setTimeout(() => {
		openModalBtn.click();
	}, 500);
});
