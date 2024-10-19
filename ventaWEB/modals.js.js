document.addEventListener("DOMContentLoaded", () => {
	const btnRealizarPago = document.getElementById("obutRealizarPago");

	const modal = document.getElementById("myModal");
	const openModalBtn = document.getElementById("openModalBtn");
	const btnConfirmarOperacion = document.getElementById(
		"obutConfirmaOperacion",
	);

	const closeModalBtn = document.getElementById("closeModalBtn");

	modal.style.display = "none";

	openModalBtn.addEventListener("click", (event) => {
		console.log(event);
		event.preventDefault();
		modal.style.display = "flex";

		document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
	});

	// Cierra modal
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

	//Simula un clic automático en el botón openModalBtn una vez al cargar la página
	setTimeout(() => {
		openModalBtn.click();
	}, 1000);

	const btnPremiosPrincipales = document.getElementById("obutPremios");

	btnPremiosPrincipales.click(() => {
		alert("Click");
	});
});
