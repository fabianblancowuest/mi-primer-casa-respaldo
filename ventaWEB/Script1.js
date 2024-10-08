
window.addEventListener('scroll', function () {
    const scrollIndicator = document.querySelector('.scroll-indicator');
    if (window.scrollY === 0) {
        scrollIndicator.style.display = 'block';
    } else {
        scrollIndicator.style.display = 'none';
    }
});

window.addEventListener('load', function () {
    const scrollIndicator = document.querySelector('.scroll-indicator');
    if (document.body.scrollHeight > window.innerHeight) {
        scrollIndicator.style.display = 'block';
    }
});