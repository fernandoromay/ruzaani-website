// Banner Login Script
document.addEventListener('DOMContentLoaded', () => {
    const loginLinks = document.querySelectorAll('.login-link');
    loginLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            document.cookie = "rz_show_login=1; path=/; max-age=31536000; SameSite=Lax";
            window.location.href = "<?= $navLoginLink[$lang] ?>";
        });
    });
});

// Extracting answers to hidden fields before submit
document.getElementById('audit-form').addEventListener('submit', function (e) {
    const q1 = document.querySelector('input[name="question-1"]:checked');
    const q2 = document.querySelector('input[name="question-2"]:checked');
    if (q1) document.getElementById('question-1-answer').value = q1.value;
    if (q2) document.getElementById('question-2-answer').value = q2.value;
});