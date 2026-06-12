/* product.js — Ruzaani Product Page */

(function () {
    'use strict';


    /* ── Navbar hide on scroll ──────────────────────────────── */
    const navbar = document.querySelector('.navbar-top');
    let lastScrollY = window.scrollY;

    window.addEventListener(
        'scroll',
        () => {
            const current = window.scrollY;
            if (navbar) {
                navbar.classList.toggle('hidden', current > lastScrollY && current > 80);
            }
            lastScrollY = current;
        },
        { passive: true }
    );

    /* ── Staggered entrance for metric chips ────────────────── */
    document.querySelectorAll('.metric-chip').forEach((chip, i) => {
        chip.style.transitionDelay = `${i * 80}ms`;
        chip.classList.add('reveal');
    });

    /* ── Sticky Conversation Animation ────────────────────────── */
    const aiVisuals = document.getElementById('ai-sticky-visuals');
    const scrollSteps = document.querySelectorAll('.ai-scroll-step');

    if (aiVisuals && scrollSteps.length > 0) {
        const updateConversation = () => {
            const viewportHeight = window.innerHeight;
            const threshold = viewportHeight * 0.45;
            let activeStep = 0;

            scrollSteps.forEach((step, index) => {
                const rect = step.getBoundingClientRect();
                if (rect.top < threshold) {
                    activeStep = index;
                }
            });

            aiVisuals.setAttribute('data-sub-step', activeStep.toString());
        };

        window.addEventListener('scroll', updateConversation, { passive: true });
        window.addEventListener('resize', updateConversation, { passive: true });
        updateConversation();
        console.log('AI Sticky Animation Initialized');
    }

})();
