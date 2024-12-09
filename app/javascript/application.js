// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "@popperjs/core"

document.addEventListener('DOMContentLoaded', function () {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
});

$(document).ready(function () {
    $('#roda_preco').mask('000.000.000,00', { reverse: true });
});

document.addEventListener('turbolinks:load', () => {
    const form = document.querySelector('form');
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        const url = new URL(form.action);
        const params = new URLSearchParams(new FormData(form));
        fetch(`${url}?${params.toString()}`, { headers: { Accept: 'text/javascript' } })
            .then(response => response.text())
            .then(eval);
    });
});


document.querySelectorAll('.btn-dark-premium').forEach(button => {
    button.addEventListener('click', () => {
        const spinner = document.getElementById('spinner');
        spinner.style.display = 'block';
    });
});
