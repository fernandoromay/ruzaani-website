/* pricing.js */
(function () {
    'use strict';

    /* ── Enterprise Modal ── */
    const overlay  = document.getElementById('enterprise-modal');
    const openBtns = document.querySelectorAll('[data-modal="enterprise"]');
    const closeBtn = document.getElementById('modal-close-btn');

    function openModal() {
        overlay.classList.add('open');
        document.body.style.overflow = 'hidden';
    }

    function closeModal() {
        overlay.classList.remove('open');
        document.body.style.overflow = '';
    }

    openBtns.forEach((btn) => btn.addEventListener('click', openModal));

    if (closeBtn) closeBtn.addEventListener('click', closeModal);

    if (overlay) {
        overlay.addEventListener('click', (e) => {
            if (e.target === overlay) closeModal();
        });
    }

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') closeModal();
    });

    /* ── FAQ Accordion ── */
    document.querySelectorAll('.faq-question').forEach((btn) => {
        btn.addEventListener('click', () => {
            const item   = btn.closest('.faq-item');
            const answer = item.querySelector('.faq-answer');
            const isOpen = item.classList.contains('open');

            // Close all open items
            document.querySelectorAll('.faq-item.open').forEach((openItem) => {
                openItem.classList.remove('open');
                openItem.querySelector('.faq-answer').style.maxHeight = '0';
            });

            // Open clicked if it was closed
            if (!isOpen) {
                item.classList.add('open');
                answer.style.maxHeight = answer.scrollHeight + 'px';
            }
        });
    });

    /* ── Discount bars animate on scroll ── */
    const discountBars = document.querySelectorAll('.discount-bar');

    const barObserver = new IntersectionObserver(
        (entries) => {
            entries.forEach((e) => {
                if (e.isIntersecting) {
                    // Width is set via data-width in HTML
                    const w = e.target.dataset.width || '0%';
                    setTimeout(() => { e.target.style.width = w; }, 150);
                    barObserver.unobserve(e.target);
                }
            });
        },
        { threshold: 0.5 }
    );

    discountBars.forEach((bar) => {
        bar.style.width = '0%'; // start at 0
        barObserver.observe(bar);
    });

    /* ── Navbar hide on scroll ── */
    const navbar = document.querySelector('.navbar-top');
    let lastY = window.scrollY;
    window.addEventListener(
        'scroll',
        () => {
            const cur = window.scrollY;
            if (navbar) navbar.classList.toggle('hidden', cur > lastY && cur > 80);
            lastY = cur;
        },
        { passive: true }
    );

})();
